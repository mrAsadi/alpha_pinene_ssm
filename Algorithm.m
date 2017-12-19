clc;
clear;
filename='main.txt';
data=csvread(filename);
expt=zeros(9,1);
expt(2:9,:)=data(:,1);
expx=data(1:8,2:6);
Population=initialize();
Ref_Set = Ref_Set_Generation_First(Population,expt,expx);
best = size(Ref_Set,1)/2;
b = size(Ref_Set,1);
t = timer('TimerFcn', 'stat=false;','StartDelay',300);
start(t)
stat = true;
counter = 0;
result_curve=[];
 while(stat==true)
    counter = counter + 1;
    Comb = Combination(Ref_Set,b);
    simulated = Simulate(Comb,expt,expx);
    simulated = sortrows(simulated,6);
    Ref_Set = Ref_Set_Update(Ref_Set,simulated);
    result_curve(counter,:) = Ref_Set(1,6);
 end
plot(result_curve(1,:));