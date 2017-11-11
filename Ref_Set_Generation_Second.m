function [ Ref_Set ] = Ref_Set_Generation_Second( Result )
best=6;
param_count=5;
Ref_Set=ones(3,param_count);
low=0;
up=1;
h=best/2;
f_size=size(Result,1);
d=ones(h*2,f_size);
d=d+realmax;
Ref_Set(1,:)=low;
Ref_Set(2,:)=up;
Ref_Set(3,:)=(up-low)/2;

for i = 1:h
    Point1 = Ref_Set(i,:);
    Diff=[];
    m_size=size(Result,1);
    for j=h+1:m_size
        Point2 = Result(j,:);
        V = Point1 - Point2;
        Diff =sqrt(V * V');
        d(i,j)=Diff;
    end
    min=realmax;
    for j=h+1:f_size
        if (d(i,j)<min)
           min=d(i,j);
           index=j;
        end
    end
    d_min(i,:)=index;
    Ref_Set(i+h,:)=Result(index,:);
    Result(index,:)=[];
end
end

