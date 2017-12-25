function [ Ref_Set ] = Ref_Set_Generation_Second(Population,Ref_Set)
    Result = Population(1:end,1:size(Population,2)-1);
    indexer=0;
    for i = 1:size(Ref_Set,1)
        Point1 = Ref_Set(i,1:end-1);
        index = Distance_Factor(Result,Point1);
        Ref_Set(i , :) = Population(index+indexer,:);
        indexer=indexer + 1;
        Result(index,:) = [];
    end
end

