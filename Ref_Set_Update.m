function [ Ref_Set,Combinations ] = Ref_Set_Update( Ref_Set,Combinations )
comb_count = size(Combinations,1);
ref_count = size(Ref_Set,1);
ref_temp = Ref_Set;
for i = 1:comb_count
   candidate = Combinations(i,:);
   index=0;
   for j = 1:ref_count
       if(candidate(:,6) < Ref_Set(j,6))
           index = j;
           break;
       end
   end
   if(index ~= 0)
       ref_temp(index,:) = candidate;
   end
end
Ref_Set = ref_temp;
end