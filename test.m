
diff=10000000;
time=1;
result=0;
%p=rand(5,1)/10000;
p=[0.0000593,0.0000296,0.0000205,0.000275,0.00004];
tspan = 0:1:40000;
tic;
[t,x]=ode45(@(t,x)OdeSystem(t,x,p),tspan,[100,0,0,0,0]);
toc;
filename='main.txt';
data=csvread(filename);
expt=data(:,1);
expx=data(1:8,2:6);
testT=zeros(size(t));
testX=zeros(size(x));
difft=0;
for i=1:8
    for j=1:5
        testX(expt(i),j)= expx(i,j);
        difft = difft + (expx(i,j)- x(expt(i),j))^2 ;
    end
end
if(difft <= diff)
    diff = difft;
    result(time,1) = diff;
    time = time + 1;
end
testX(testX==0) = nan ;
plot(t,x,t,testX,'.');
figure;
plot(result);