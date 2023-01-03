%This script is the bulk of the code, and the most difficult part to grasp. This
%script accomplishes many things at once in order to be more efficent. The
%script prompts the user to choose to reveal or flag a tile, and reveals or
%flags tiles based on the input. There are many complexities including
%unflagging tiles that are already flagged, and revealing multiple tiles
%with one click if the rules of minesweeper call for it.

justRevealed = zeros(boardSize); % variable used to temporarily track where tiles were just revealed
disp('Please enter an "r" to reveal the tile or an "f" to flag/unflag it.')
check = 0;
while check == 0
    h = figure(1);
    waitforbuttonpress;
    k = get(h,'CurrentKey');
    if k == 'r' || k == 'f'
        check = 1;
    else
        err3 = errordlg('Invalid key. Please enter an "r" to reveal the tile or an "f" to flag/unflag it.'); pause(.75);
    end
end
%error tracked key input that decides if user wants to reveal or flag
%selected tile. We use a key input here becasue it is much faster than
%clicking a button, and the game takes a lot of inputs so it really speeds
%it up.

if k == 'r' %user decides to reveal tile
    if boardGen(row,col) == 9
        gameOver = 1;
        winCheck(row,col) = 0;
        [mineSweeperGraphics,MineSweeperBoard] = reveal(row,col,boardGen,mineSweeperGraphics,MineSweeperBoard);
        %if the user reveals a bomb, the game is over and a bomb is put
        %into the display
    else
        %otherwise, the tile is revealed and a 1 is put into the win
        %tracker so once the user reveals all the tiles the game ends
        [mineSweeperGraphics,MineSweeperBoard] = reveal(row,col,boardGen,mineSweeperGraphics,MineSweeperBoard);
        winCheck(row,col) = 1;
        justRevealed(row,col) = 1; %temporarily registers tile as revealed for the following while loop
    end
    while 1 == 1 %infinite loop, breaks when there is no longer a nonzero value in justRevealed
        [tmpr,tmpc] = find(justRevealed,1); %finds the first instance of a one and indexes it
        justRevealed(tmpr,tmpc) = 0; %makes the 1 just found a 0 to prevent infinite loop, this way every tile that is revealed only goes through the loop
        edgeCase = [tmpr,tmpc];
        if isempty(edgeCase) %if there weren't any ones found in justRevealed, then this will be empty and the loop breaks
            break
        end
        if isequal(edgeCase,[1,1]) % top left edge case
            topLeftBoard;
        elseif isequal(edgeCase,[1,boardSize]) % top right edge case
            topRightBoard;
        elseif isequal(edgeCase,[boardSize,1]) % bot left edge case
            botLeftBoard;
        elseif isequal(edgeCase,[boardSize,boardSize]) %bot right edge case
            botRightBoard;
        elseif tmpr == 1 %top row edge case
            topBoard;
        elseif tmpr == boardSize %bottom row edge case
            botBoard;
        elseif tmpc == 1 %left column edge case
            leftBoard;
        elseif tmpc == boardSize %right column edge case
            rightBoard;
        else %not an edge case, in the middle of the board
            midBoard; %This script is commented and explains all edge cases, would be redundant to explain every similar function
        end
    end
elseif k == 'f' %user decides to flag tile (or remove flag)
    if flags(row,col) == 0 %if there is no flag on tile
        flags(row,col) = 1; %records a flag on tile
        MineSweeperBoard{row,col} = mineSweeperGraphics{12};
        %puts a graphical flag on the tile in the graphics board
    else %there is a flag on the tile
        flags(row,col) = 0; %records no flag on tile 
        MineSweeperBoard{row,col} = mineSweeperGraphics{11};
        %puts a graphical unrevealed tile on the graphics board
    end
end