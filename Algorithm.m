clc;
clear;
filename = 'main_1.txt';
data=csvread(filename);
expt=data(:,1);
expx=data(1:8,2:6);
pop=50;best=10;sub_range=4;param_count=5;
Population = Log_Init(pop,sub_range,param_count);
Ref_Set = Ref_Set_Generation_First(Population,expt,expx,best);
b = size(Ref_Set,1);
% t = timer('TimerFcn', 'stat = false;/','StartDelay',1200);
% start(t)
% stat = true;
% counter=0;
result_curve = [];
% while(stat == true)
tic;
for counter = 1:100
    % counter = counter+1;
    Comb = Combination(Ref_Set,b);
    simulated = Simulate_Second(Comb,expt,expx);
    simulated = sortrows(simulated,6);
    Ref_Set = Ref_Set_Update(Ref_Set,simulated);
    result_curve(counter,:) = Ref_Set(1,6);
end
toc;
plot(result_curve(:,1));
tspan = 0:1:40000;
[tt,y] = ode15s(@(tt,y)OdeSystem(tt,y,Ref_Set(1,1:5)),tspan,[100,0,0,0,0]);
testX = zeros(size(y));
difft=0;
for i=1:8
    for j=1:5
        testX(expt(i),j)= expx(i,j);
    end
end
testX(testX==0) = nan ;
figure;
plot(tt,y,tt,testX,'.');
>>>>>>> 2c2319c
