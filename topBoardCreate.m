function [boardGen] = topBoardCreate(row,col,boardGen)
if boardGen(row,col) == 9
    for i = row:row+1
        for j = col-1:col+1
            if boardGen(i,j) < 9
                boardGen(i,j) = boardGen(i,j) + 1;
            end
        end
    end
end