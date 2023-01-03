%this script reveals all tiles surrounding a zero in a 3x3 , and checks all tiles
%in a 3x3 around a non zero for zeros to reveal

%For edge cases, since there is not a full 3x3 around them, this code will not work
%and there needs to be a seperate code for each corner and edge. These
%scripts only check where there are tiles surrounding the element. 

winCheck(tmpr,tmpc) = 1; %records tile as revealed permanently for checking win condition (all non bomb tiles revealed)
if boardGen(tmpr,tmpc) == 0 %if there are no bombs surrounding the indexed tile (zero)
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc+1 
            %for all adjacent tiles
            if winCheck(i,j) == 0 %if the tile hasn't been permanently revealed yet (prevents infinite loop)
                [mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,boardGen,mineSweeperGraphics,MineSweeperBoard);
                %reveals tile (graphics fn)
                winCheck(i,j) = 1; %records tile as revealed permanently
                justRevealed(i,j) = 1; 
                %records tile as revealed temporarily, this runs the loop 
                %again for the tiles revealed once the current iteration 
                %of the loop is finished
            end
        end
    end
else %there are bombs surrounding the tile (non-zero)
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc+1
            %for all adjacent tiles
            if winCheck(i,j) == 0 && boardGen(i,j) == 0 
                %if the tile has not been permanently 
                % revealed yet and there are no bombs around it (it is a zero)
                
                [mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,boardGen,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1; 
                justRevealed(i,j) = 1;
                %same process as above
            end
        end
    end
end