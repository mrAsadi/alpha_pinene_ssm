function [ C ] = Combination( Ref_Set,b )
best=b/2;
index=1;
Result=Ref_Set;
Ref_Set(:,6)=[];
for i=1:best-1
    x1=Ref_Set(i,:);
    j=i+1;
    x2=Ref_Set(j,:);
    d = rand(1,5).*(x2-x1)/2;
    C(index,:)=x1-d;
    C(index+1,:)=x1+d;
    C(index+2,:)=x2+d;
    index=index+3;
end
for i=best:b-1
    x1=Ref_Set(i,:);
    j=i+1;
    x2=Ref_Set(j,:);
    d=rand(1,5).*(x2-x1)/2;
    C(index,:)=x1+d;
    if(rand() < 0.5)
         C(index+1,:)=x1-d;
    else
         C(index+1,:)=x2+d;
    end
    index=index+2;
end
% 
% for i=1:best-1
%     x1=Ref_Set(i,:);
%     j=i+1;
%     x2=Ref_Set(j,:);
%     d=rand(1,5).*(x2-x1)/2;
%     C(index,:)=x1-d;
%     C(index+1,:)=x1+d;
%     C(index+2,:)=x2+d;
%     index=index+1;
% end
Ref_Set=Result;
end

