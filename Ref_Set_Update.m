function [ Ref_Set ] = Ref_Set_Update( Ref_Set,Combinations )
comb_count = size(Combinations,1);
ref_count = size(Ref_Set,1);
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
       Ref_Set(index,:) = candidate;
   end
end
end