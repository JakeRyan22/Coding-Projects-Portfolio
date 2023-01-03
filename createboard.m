function boardGen = createboard(boardSize,numberBombs)
%%Creates a matrix of numbers that will be used to compute the game,
%%seperate from the graphics matrix
rng shuffle
randomizer = randperm(boardSize^2); %non repeating integers from 1 to the # of elements in board
boardGen = zeros(boardSize); %initializes the board matrix
counter = 1; %counter for the randomizer, because it is a row vector so (row,col) doesn't work

%nested for loops to refer to each element of the board matrix and add a 9
%if the randomizer for that element calls for a bomb

for row = 1:boardSize
    for col = 1:boardSize
        if randomizer(counter) <= numberBombs
            boardGen(row,col) = 9; %puts a set amount of 9s into the zeros matrix, these are the bombs
        end
        counter = counter + 1; %counter adds 1 every loop so it refers the randomizer to the correct element
    end
end

%nested for loops to check each element of the boardGen matrix for
%bombs (9s) and put the numbers around them
for row = 1:boardSize
    for col = 1:boardSize
        edgeCase = [row,col]; %variable used to check edge cases
        if isequal(edgeCase,[1,1]) %top left corner
            [boardGen] = topLeftBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[1,boardSize]) %top right corner
            [boardGen] = topRightBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[boardSize,1]) %bot left corner
            [boardGen] = botLeftBoardCreate(row,col,boardGen);
        elseif isequal(edgeCase,[boardSize,boardSize]) %bot right corner
            [boardGen] = botRightBoardCreate(row,col,boardGen);
        elseif row == 1 %top edge
            [boardGen] = topBoardCreate(row,col,boardGen);
        elseif row == boardSize %bot edge
            [boardGen] = botBoardCreate(row,col,boardGen);
        elseif col == 1 %left edge
            [boardGen] = leftBoardCreate(row,col,boardGen);
        elseif col == boardSize %right edge
            [boardGen] = rightBoardCreate(row,col,boardGen);
        else %anywhere else on board (in the middle)
            [boardGen] = midBoardCreate(row,col,boardGen); %this fn has comments, other boardcreate fns are similar edge cases that would be redundant to comment
        end
    end
end