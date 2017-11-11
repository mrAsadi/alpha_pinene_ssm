function [ Result ] = Simulate( S )
Result=[];
filename='main_1.txt';
data=csvread(filename);
expt=data(:,1);
expx=data(1:8,2:6);
end_counter=size(S,1);
for counter=1:end_counter
    p=S(counter,:);
    tspan = 0:0.0001:4;
    [t,x]=ode45(@(t,x)OdeSystem(t,x,p),tspan,[100,0,0,0,0]);
    testX=zeros(size(x));
    difference=0;
    for i=1:8
        for j=1:5
            testX(expt(i),j)= expx(i,j);
            difference = difference + (expx(i,j)- x(expt(i),j))^2 ;
        end
    end
    p=[p difference];
    Result(counter,:) = p;
end
end

