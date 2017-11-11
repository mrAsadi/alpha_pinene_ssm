function [ d_vec ] = Distance_Factor( inp_mat,inp_vec )
    diff = [];
    m_size = size(inp_mat,1);
    for j = 1:m_size
        Point2 = inp_mat(j,:);
        V = inp_vec - Point2;
        diff = sqrt(V * V');
        d(1,j) = diff;
    end
    min=realmax;
    for j=1:m_size
        if (d(1,j)< min)
           min = d(1,j);
           index = j;
        end
    end
    d_vec(1 , :) = inp_mat(index,:);
end


