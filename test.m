clc;
clear;
diff=10000000;
time=1;
result=0;
filename='main.txt';
data=csvread(filename);
expt=zeros(9,1);
expt(2:9,:)=data(:,1);
expx=data(1:8,2:6);
span=zeros(size(expt,1)+1,1);
span(2:size(expt,1)+1,:)=expt;
p=[5.9256 * 10^ -5,2.9632 * 10 ^ - 5,2.0450 * 10 ^ -5,2.7473 * 10 ^ -4, 4.0073 * 10 ^ -5];
tspan = 0:1:40000;
tic;
[tt,y] = ode113(@(tt,y)OdeSystem(tt,y,p),tspan,[100,0,0,0,0]);
toc;
testX = zeros(size(y));
difference = 0;
    for i=1:8
        for j=1:5
            difference = difference + (expx(i,j)- y(expt(i+1),j))^2 ;
        end
    end
for i=1:8
    for j=1:5
        testX(expt(i+1),j)= expx(i,j);
    end
end
testX(testX==0) = nan ;
plot(result);
figure;
plot(tt,y,tt,testX,'.');