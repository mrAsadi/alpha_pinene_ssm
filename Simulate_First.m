function [ Result ] = Simulate_First( S ,expt,expx)
end_counter=size(S,1);
Result = zeros(size(S,1),size(S,2)+1);
tspan = 0:0.0001:4;
for counter = 1:end_counter
    p=S(counter,:);
    [~,x]=ode45(@(t,x)OdeSystem(t,x,p),tspan,[100,0,0,0,0]);
    difference = 0;
    for i=1:8
        for j=1:5
            difference = difference + (expx(i,j)- x(expt(i),j))^2 ;
        end
    end
    Result(counter,:) = [p difference];
end
end