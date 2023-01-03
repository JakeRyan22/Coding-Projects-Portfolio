function [boardGen] = botLeftBoardCreate(row,col,boardGen)
if boardGen(row,col) == 9
    for i = row-1:row
        for j = col:col+1
            if boardGen(i,j) < 9
                boardGen(i,j) = boardGen(i,j) + 1;
            end
        end
    end
end