clc;
clear;
tic;
Population=initialize();
Ref_Set=Ref_Set_Generation_First(Population);
best=size(Ref_Set,1)/2;
b = size(Ref_Set,1);
t = timer('TimerFcn', 'stat=false;','StartDelay',5);
start(t)
stat=true;
while(stat==true)
  Comb = Combination(Ref_Set,b);
end
toc;