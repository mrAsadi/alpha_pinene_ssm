function [ S,Ref ] = Uniform_Init()
clc;
clear;
S=[];
pop=10;
sub_range=4;
param_count=5;
up=10^4;
low=10^-12;
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
    for j=1:sub_range
        xli=bounds(i,1);
        xui=bounds(i,2);
        sub_ranges_low(i,j)=xli+((xui/sub_range) - (xli/sub_range))*(j-1);
        sub_ranges_up(i,j)=xli+((xui-xli)/sub_range)*(j);
    end
end
%generate first diverse variable vectors from defined bounds

for i=1:param_count
    for j=1:sub_range
        A=sub_ranges_low(i,j);
        B=sub_ranges_up(i,j);
        variable=A+((B-A)*rand);
        S(j,i)=variable;
    end
end
%generate all other diverse variables 

for t=sub_range+1:pop
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
%generate Ref for seceond reference set generation strategy
Ref=ones(3,param_count);
A=sub_ranges_low(1,j);
B=sub_ranges_up(i,j);
C=(B-A)/2;
Ref(1,:)=A;
        
end