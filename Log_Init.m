function [ S ] = Log_Init(pop,sub_range,param_count)
S=[];
up=0;
low=-12;
frequencies=ones(param_count,sub_range);
sub_ranges_low=zeros(param_count,sub_range);
sub_ranges_up=zeros(param_count,sub_range);
% define bounds for each variable (first column is lower and second is
% upper bound respectively
bounds = zeros(param_count,2);
bounds(:,1)=low;
bounds(:,2)=up;
prob=[];
%generate bounds for each subranges
for i=1:param_count
   xli=bounds(i,1);
   xui=bounds(i,2);
   ranges(i,:)= logspace(xli,xui,sub_range+1);
end
for i=1:param_count
    for j=1:sub_range
        sub_ranges_low(i,j)=ranges(i,j);
        sub_ranges_up(i,j)=ranges(i,j+1);
    end
end

%my idea : insert all ranges in population
index=1;
for i=1:sub_range
    S(index,:)=sub_ranges_low(:,i);
    S(index+1,:)=sub_ranges_up(:,i);
    index=index+1;
end
index=index+1;
for i=1:sub_range
    A=sub_ranges_low(:,i);
    B=sub_ranges_up(:,i);
    S(index,:)=(A+B)/2;
    index=index+1;
end

for i=1:sub_range
    A=sub_ranges_low(:,i);
    B=sub_ranges_up(:,i);
    S(index,:)=((A+B)/2).*rand(5,1);
    index=index+1;
end

%generate first diverse variable vectors from defined bounds
for i=1:sub_range
    A = sub_ranges_low(:,i);
    B = sub_ranges_up(:,i);
    variable(i,:)=A+((B-A).*rand(5,1));
    S(index,:)=variable(i,:);
    index=index+1;
end

%generate all other diverse variables

for t=index:pop
    for i=1:param_count
       for j=1:sub_range
           sums=0;
           for k=1:sub_range
               sums = sums+(1/frequencies(i,k));
           end
           prob(i,j)=(1/frequencies(i,j))/sums;
       end
       random_number = rand;
       S_prob=0;
       for a = 1:sub_range
          S_prob = S_prob + prob(i,a);
          if(random_number <= S_prob )
              index=a;
              frequencies(i,a)=frequencies(i,a)+1;
              break;
          end
       end
       A=sub_ranges_low(i,index);
       B=sub_ranges_up(i,index);
       new_variable=A+((B-A)*rand);
       S(t,i)=new_variable;
    end
end
end