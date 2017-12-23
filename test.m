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
<<<<<<< HEAD
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
=======
span=zeros(size(expt,1)+1,1);
span(2:size(expt,1)+1,:)=expt;
tic;
for counter = 1:20
    p = rand(5,1);
    %p=[0.0000593,0.0000296,0.0000205,0.000275,0.00004];
    %tspan = 0:1:40000;
    [t,x] = ode15s(@(t,x)OdeSystem(t,x,p),span,[100,0,0,0,0]);
    testX = zeros(size(x));
    difft=0;
    for i=1:8
        for j=1:5
            testX(expt(i),j)= expx(i,j);
            difft = difft + (expx(i,j)- x(i+1,j))^2 ;
        end
    end
    if(difft <= diff)
        diff = difft;
        result(time,1) = diff;
        time = time + 1;
    end
end
toc;
tspan = 0:1:40000;
[tt,y] = ode45(@(tt,y)OdeSystem(tt,y,p),tspan,[100,0,0,0,0]);
testX = zeros(size(y));
difft=0;
for i=1:8
    for j=1:5
        testX(expt(i),j)= expx(i,j);
    end
end
testX(testX==0) = nan ;
plot(result);
>>>>>>> 2c2319c
figure;
plot(tt,y,tt,testX,'.');