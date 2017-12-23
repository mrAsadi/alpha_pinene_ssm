function [ Result ] = Simulate_Second( S ,expt,expx)
end_counter = size(S,1);
Result=zeros(size(S,1),size(S,2)+1);
span=zeros(size(expt,1)+1,1);
span(2:size(expt,1)+1,:)=expt;
for counter=1:end_counter
    p=abs(S(counter,:));
    [~,x]=ode15s(@(t,x)OdeSystem(t,x,p),span,[100,0,0,0,0]);
    difference=0;
    for i=1:8
        for j=1:5
            difference = difference + (expx(i,j)- x(i+1,j))^2 ;
        end
    end
    Result(counter,:) = [p difference];
end
end

