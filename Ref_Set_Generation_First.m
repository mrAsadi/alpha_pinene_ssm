function [ Ref_Set ] = Ref_Set_Generation_First( S ,best )
    
    Ref_Set = zeros(best,size(S,2));
    h = best/2;
    Result = S;
    for i=1:h
        Ref_Set(i,:)= Result(i,:);
    end
    
    Result = S(h+1:end,1:size(S,2)-1);
    indexer=0;
    for i = 1:h
        Point1 = Ref_Set(i,1:end-1);
        index = Distance_Factor(Result,Point1);
        Ref_Set(i+h , :) = S(index+h+indexer,:);
        indexer=indexer + 1;
        Result(index,:) = [];
    end
end
