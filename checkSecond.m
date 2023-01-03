%checks to see if the user clicked on a card that is facing down
check = 0;
    while check == 0
        if r2 < 1 || r2 > 4 || c2 < 1 || c2 > 4 %if the user clicked off the board
            disp('Invalid choice, please click on a card.')
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
            %takes input again
        elseif memBoardCompute(r2,c2) == 0 %if the user clicked on a cleared space
            disp('Card already cleared, please click on another.')
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
            %takes input again
        elseif isequal([r1,c1],[r2,c2])
            disp('You just revealed this card, please click on another.')%if user clicked on the same card again
            [x,y] = ginput(1);
            r2 = floor(y/96) + 1;
            c2 = floor(x/72) + 1;
            %takes input again
        else
            check = 1; %otherwise, breaks loop
        end
    end