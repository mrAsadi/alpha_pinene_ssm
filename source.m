diff=10000000;
time=1;
result=0;
tic;
for count=1:5
    p=rand(5,1)/(10^count);
    tspan = 0:1:40000;
    [t,x]=ode45(@(t,x)OdeSystem(t,x,p),tspan,[100,0,0,0,0]);
    filename='main_1.txt';
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
        z=x;
    end
end
testX(testX==0) = nan ;
plot(t,z,t,testX,'.');
figure;
plot(result);
toc;