clc;
clear;
tic;
Population=initialize();
Ref_Set=Ref_Set_Generation_First(Population);
best=size(Ref_Set,1)/2;
b = size(Ref_Set,1);
t = timer('TimerFcn', 'stat=false;','StartDelay',300);
start(t)
stat=true;
counter=0;
result_curve=[];
while(stat==true)
    counter=counter+1;
    Comb = Combination(Ref_Set,b);
    simulated=Simulate(Comb);
    simulated = sortrows(simulated,6);
    Ref_Set=Ref_Set_Update(Ref_Set,simulated);
    result_curve(counter,:)=Ref_Set(1,6);
end
plot(resutl_curve(:,1));
toc;