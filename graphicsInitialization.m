if boardSize == 9
    for i = 1:9
        for j = 1:9
            MineSweeperBoard{i,j} = mineSweeperGraphics{11};
        end
    end
    imshow([MineSweeperBoard{1,:};MineSweeperBoard{2,:};MineSweeperBoard{3,:};MineSweeperBoard{4,:};MineSweeperBoard{5,:};MineSweeperBoard{6,:};MineSweeperBoard{7,:};MineSweeperBoard{8,:};MineSweeperBoard{9,:}])
elseif boardSize == 18
    for i = 1:18
        for j = 1:18
            MineSweeperBoard{i,j} = mineSweeperGraphics{11};
        end
    end
    imshow([MineSweeperBoard{1,:};MineSweeperBoard{2,:};MineSweeperBoard{3,:};MineSweeperBoard{4,:};MineSweeperBoard{5,:};MineSweeperBoard{6,:};MineSweeperBoard{7,:};MineSweeperBoard{8,:};MineSweeperBoard{9,:};MineSweeperBoard{10,:};MineSweeperBoard{11,:};MineSweeperBoard{12,:};MineSweeperBoard{13,:};MineSweeperBoard{14,:};MineSweeperBoard{15,:};MineSweeperBoard{16,:};MineSweeperBoard{17,:};MineSweeperBoard{18,:}])
elseif boardSize == 24
    for i = 1:24
        for j = 1:24
            MineSweeperBoard{i,j} = mineSweeperGraphics{11};
        end
    end
    imshow([MineSweeperBoard{1,:};MineSweeperBoard{2,:};MineSweeperBoard{3,:};MineSweeperBoard{4,:};MineSweeperBoard{5,:};MineSweeperBoard{6,:};MineSweeperBoard{7,:};MineSweeperBoard{8,:};MineSweeperBoard{9,:};MineSweeperBoard{10,:};MineSweeperBoard{11,:};MineSweeperBoard{12,:};MineSweeperBoard{13,:};MineSweeperBoard{14,:};MineSweeperBoard{15,:};MineSweeperBoard{16,:};MineSweeperBoard{17,:};MineSweeperBoard{18,:};MineSweeperBoard{19,:};MineSweeperBoard{20,:};MineSweeperBoard{21,:};MineSweeperBoard{22,:};MineSweeperBoard{23,:};MineSweeperBoard{24,:}])
end