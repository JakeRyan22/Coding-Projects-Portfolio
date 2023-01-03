function [boardGen] = midBoardCreate(row,col,boardGen)
%This function checks to see if an element is a bomb, then adds one to all
%non-bomb tiles surrounding it (so checks a 3x3 around it). This creates
%the numbers in the minesweeper board that tell you how many bombs are next
%to a tile, as this is repeated for every element in the board. 

%For edge cases, since there is not a full 3x3 around them, this code will not work
%and there needs to be a seperate code for each corner and edge. These
%functions only check where there are tiles surrounding the element. 

if boardGen(row,col) == 9 
    for i = row-1:row+1
        for j = col-1:col+1
            if boardGen(i,j) < 9
                boardGen(i,j) = boardGen(i,j) + 1;
            end
        end
    end
end