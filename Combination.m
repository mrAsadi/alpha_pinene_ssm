function [ C ] = Combination( Ref_Set,b )
best=b/2;
index=1;
Result=Ref_Set;
Ref_Set(:,6)=[];
%both x1 , x2 belong to first b/2 of ref_set
for i=1:best-1
    x1=Ref_Set(i,:);
    j=i+1;
    x2=Ref_Set(j,:);
    d =(x2-x1)/2;
    %generate one solution in rectangle 1 (x1-d,x1)
    C(index,:)= Rand_In_Rect(x1-d,x1,rand(1,5));
    %generate one solution in rectangle 3 (x2,x2+d)
    C(index+1,:)=Rand_In_Rect(x2,x2+d,rand(1,5));
    %generate two solution in rectangle 2 (x1,x1+d)
    C(index+2,:)=Rand_In_Rect(x1,x1+d,rand(1,5));
    C(index+3,:)=Rand_In_Rect(x1,x1+d,rand(1,5));
    
    index=index+4;
end
%both of x1 , x2 belongs to second b/2 of ref_set
for i=best:b-1
    x1=Ref_Set(i,:);
    j=i+1;
    x2=Ref_Set(j,:);
    d=(x2-x1)/2;
    
    %generate one solution in rectangle 2 (x1,x1+d)
    C(index,:)= Rand_In_Rect(x1,x1+d,rand(1,5));
    
    if(rand() < 0.5)
        %generate one solution in rectangle 1 (x1,x1-d)
        C(index+1,:)= Rand_In_Rect(x1-d,x1,rand(1,5));
    else
        %OR
        %generate one solution in rectangle 3 (x2,x2+d)
        C(index+1,:)= Rand_In_Rect(x2,x2+d,rand(1,5));
    end
    index=index+2;
end

for i=1:best
    x1=Ref_Set(i,:);
    j=best+1;
    x2=Ref_Set(j,:);
    d=(x2-x1)/2;
    
    %generate one solution in rectangle 1 (x1,x1-d)
    C(index,:)= Rand_In_Rect(x1-d,x1,rand(1,5));
    %generate one solution in rectangle 3 (x2,x2+d)
    C(index+1,:)= Rand_In_Rect(x2,x2+d,rand(1,5));
    %generate one solution in rectangle 2 (x1,x1+d)
    C(index+2,:)= Rand_In_Rect(x1,x1+d,rand(1,5));
    index=index+3;
end
Ref_Set = Result;
end

