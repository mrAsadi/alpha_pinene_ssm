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
p=[0.0000593,0.0000296,0.0000205,0.000275,0.00004];
%p=rand(5,1);

A = 1;
B = 2;
tspan = expt;
y0 = [100,0,0,0,0];
tic;
[t,y] = ode15s(@(t,y) odefcn(t,y,p), tspan, y0);
toc;
tic;
[t,x]=ode15s(@(t,x)OdeSystem(t,x,p),expt,[100,0,0,0,0]);
toc;
tic;
[t1,x1]=ode15s(@(t1,x1)OdeSystem(t1,x1,p),1:1:40000,[100,0,0,0,0]);
toc;

difft=0;
for i=1:8
    A = expx(i,:);
    B = x(i+1,:);
    temp =(A - B).^2;
    difft =difft + sum(temp);
end
if(difft <= diff)
    diff = difft;
    result(time,1) = diff;
    time = time + 1;
end
plot(t,x,t,x,'.');
figure;
plot(result);