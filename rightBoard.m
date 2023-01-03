winCheck(tmpr,tmpc) = 1;
justRevealed;
if boardGen(tmpr,tmpc) == 0
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc
            if winCheck(i,j) == 0
                [mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,boardGen,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
else
    for i = tmpr-1:tmpr+1
        for j = tmpc-1:tmpc
            if winCheck(i,j) == 0 && boardGen(i,j) == 0
                [mineSweeperGraphics,MineSweeperBoard] = reveal(i,j,boardGen,mineSweeperGraphics,MineSweeperBoard);
                winCheck(i,j) = 1;
                justRevealed(i,j) = 1;
            end
        end
    end
end