function [ Result ] = Simulate( S,expt,expx)
end_counter=size(S,1);
Result=zeros(size(S,1),size(S,2)+1);
for counter=1:end_counter
    p=S(counter,:);
    [~,x]=ode45(@(t,x)OdeSystem(t,x,p),1:1:40000,[100,0,0,0,0]);
    difference = 0;
%     if(size(x,1)==9)
        for i = 1:8
            for j = 1:5
                difference = difference + (expx(i,j)- x(expt(i+1),j))^2 ;
            end
        end
        params =[p difference];
%     else
%           params =[p 10000000];
%     end
    Result(counter,:) = params;
end
end

