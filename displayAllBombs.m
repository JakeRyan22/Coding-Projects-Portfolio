for i = 1:boardSize
    for j = 1:boardSize
        if boardGen(i,j) == 9
            pause(.05)
            MineSweeperBoard{i,j} = mineSweeperGraphics{10};
            dispGraphics;
        end
    end
end