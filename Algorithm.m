clc;
clear;
filename = 'main_1.txt';
data=csvread(filename);
expt=data(:,1);
expx=data(1:8,2:6);
pop=100;best=10;sub_range=4;param_count=5;f_rebuild=20;
total = 41; pop_rebuild = 10;
Population = Log_Init(pop,sub_range,param_count);
Population = Simulate_Second(Population,expt,expx);
Population = sortrows(Population,6);
Best = Population(1,6);
Ref_Set = Ref_Set_Generation_First(Population,best);
b = size(Ref_Set,1);
result_curve = zeros(total,1);
result_curve(1,:) = Best;
noImprovement = 0;
noimp_cnt=0;
rebuild_cnt=0;
counter=1;
t = timer('TimerFcn', 'stat=false;','StartDelay',total);
start(t);
stat=true;
tic;
while(stat==true)
% 
% for counter = 1:total
    counter = counter+1;

% check for standard deviation of ref_set values for preventing stuck in
% flat regions and adding new diverse vector by distance filter
    if(noImprovement > pop_rebuild)
        noImprovement = 0;
        Population = Log_Init(pop/4,sub_range,param_count);
        Population = Simulate_Second(Population,expt,expx);
        Population = sortrows(Population,6);
        Ref_Temp = Ref_Set_Generation_First(Population,best);
        Ref_Temp(1,:) = Ref_Set(1,:);
        Ref_Set = Ref_Temp;
        noimp_cnt = noimp_cnt + 1;
    end
    f_reb = sum(std(Ref_Set(:,6)));
    if(f_reb > f_rebuild)
        Combinations = Combination(Ref_Set,b);
        simulated = Simulate_Second(Combinations,expt,expx);
        simulated = sortrows(simulated,6);
        Ref_Set = Ref_Set_Update(Ref_Set,simulated);
    else
        rebuild_cnt = rebuild_cnt + 1;
        noImprovement = noImprovement + 1;
        Ref_Set_Temp=Ref_Set_Generation_First(Population,best);
        Ref_Set = Rebuild_Ref_Set(Ref_Set,Ref_Set_Temp);
    end
    if(Ref_Set(1,6) < Best)
       Best = Ref_Set(1,6);
    else
        noImprovement = noImprovement + 1;
    end
    result_curve(counter,:) = Best;
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
Best=Ref_Set(1,6);
str=strcat("best is : ",num2str(Best)," rebuild_cnt=: ",num2str(rebuild_cnt)," noimp_cnt: ",num2str(noimp_cnt));
disp(str);