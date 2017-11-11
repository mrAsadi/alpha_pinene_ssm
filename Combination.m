function [ C ] = Combination( Ref_Set,b )
best=b/2;
index=1;
for i=1:best
     x1=Ref_Set(i,:);
    for j=i+1:best
        x2=Ref_Set(j,:);
        d=rand(1,5).*(x2-x1)/2;
        C(index,:)=x1-d;
        C(index+1,:)=x1+d;
        d=rand(1,5).*(x2-x1)/2;
        C(index+2,:)=x1+d;
        C(index+3,:)=x2+d;
        index=index+1;
     end
end
for i=best:b
     x1=Ref_Set(i,:);
    for j=i+1:b
        x2=Ref_Set(j,:);
        d=rand(1,5).*(x2-x1)/2;
        C(index+1,:)=x1+d;
        if(rand() < 0.5)
             C(index+2,:)=x1-d;
        else
             C(index+2,:)=x2+d;
        end
       
        index=index+1;
     end
end

for i=1:best
     x1=Ref_Set(i,:);
    for j=best+1:b
        x2=Ref_Set(j,:);
        d=rand(1,5).*(x2-x1)/2;
        C(index,:)=x1-d;
        C(index+1,:)=x1+d;
        C(index+2,:)=x2+d;
        index=index+1;
     end
end
end

