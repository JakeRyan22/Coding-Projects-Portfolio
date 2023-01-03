%checks to make sure the user clicked on a card
check = 0;
    while check == 0
        if r1 < 1 || r1 > 4 || c1 < 1 || c1 > 4 %if the user clicked off the board
            disp('Invalid choice, please click on a card.')
            [x,y] = ginput(1);
            r1 = floor(y/96) + 1;
            c1 = floor(x/72) + 1;
            %takes input again
        elseif memBoardCompute(r1,c1) == 0 %if the user clicked on a cleared space
            disp('Space already cleared, please click on another')
            [x,y] = ginput(1);
            r1 = floor(y/96) + 1;
            c1 = floor(x/72) + 1;
            %takes input again
        else
            check = 1; %otherwise, breaks loop
        end
    end