function [ Ref_Set ] = Ref_Set_Generation_First( S ,expt,expx,best )
Result = Simulate_Second(S,expt,expx);
Result = sortrows(Result,6);
% Result(:,6)=[];
Ref_Set=[];
h=best/2;
m=size(S,1);
f_size=size(Result,1);
d=ones(h*2,f_size);
d=d+realmax;
for i=1:h
    Ref_Set(i,:)=Result(i,:);
end
for i = 1:h
    Point1 = Ref_Set(i,:);
    Diff = [];
    m_size = size(Result,1);
    for j = h+1:m_size
        Point2 = Result(j,:);
        V = Point1 - Point2;
        Diff = sqrt(V * V');
        d(i,j) = Diff;
    end
    min=realmax;
    for j=h+1:m
        if (d(i,j)< min)
           min = d(i,j);
           index = j;
        end
    end
    d_min(i,:) = index;
    Ref_Set(i+h , :) = Result(index,:);
    Result(index,:) = [];
end
end
