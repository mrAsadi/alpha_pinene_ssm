function [ Ref_Set ] = Rebuild_Ref_Set( Ref_Set,Population )
ref_count = size(Ref_Set,1);
for i = ref_count/2:ref_count
    index = Distance_Factor(Population,Ref_Set(i,:));
    Ref_Set(i,:)=Population(index,:);
    Population(index,:)=[];
end
end

