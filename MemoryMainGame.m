warning off 'all'
playAgain = 1;
while playAgain == 1 %loops if user wants to play again
    clear all; close all; clc;
    load CardDeck.mat
    figure('WindowStyle','docked');

    makeBoard;

    ShuffledDeck;

    imshow([memoryBoard{1,:};memoryBoard{2,:};memoryBoard{3,:};memoryBoard{4,:}]) %displays graphics

    condition = logical(true);
    while condition
        %first user input (clicks on first card)
        disp('Please click on a card to reveal it.')
        [x,y] = ginput(1);
        r1 = floor(y/96) + 1;
        c1 = floor(x/72) + 1;

        checkFirst;

        cardPicked1 = memBoardCompute(r1,c1);
        memoryBoard{r1,c1} = RedDeck{cardPicked1};
        imshow([memoryBoard{1,:};memoryBoard{2,:};memoryBoard{3,:};memoryBoard{4,:}]);
        %updates graphics board revealing hidden value in computation matrix

        %second user input (clicks on second card)
        disp('Click on the matching card if you know it, if not take a guess.')
        [x,y] = ginput(1);
        r2 = floor(y/96) + 1;
        c2 = floor(x/72) + 1;

        checkSecond;

        cardPicked2 = memBoardCompute(r2,c2);
        memoryBoard{r2,c2} = RedDeck{cardPicked2};
        imshow([memoryBoard{1,:};memoryBoard{2,:};memoryBoard{3,:};memoryBoard{4,:}]);
        %updates graphics board revealing hidden value in computation matrix
        pause(1.5)
        %pause here to give user time to see what cards they turned over before they flip back

        matchOrNot;

        if sum(memBoardCompute,"all") == 0 %if all matches found
            condition = false; %break loop
        end
        imshow([memoryBoard{1,:};memoryBoard{2,:};memoryBoard{3,:};memoryBoard{4,:}]);
    end
    close(1) %closes figrue so user can see message
    msg1 = msgbox('Congratulations, You win!','Congratulations!');pause(2);close(msg1);
    %only way to break loop is to win, so once the user wins it displays
    %this message
   
    playAgain = input('Would you like to play again? Type 1 for yes or 0 for no, then hit enter. \n');
    check = 0;
    %a way for the user to play the game again without restarting the code
    while check == 0
        if playAgain == 0 || playAgain == 1
            check = 1;
        else
            playAgain = input('Invalid input, please try again. Type 1 to play again, or a 0 to stop playing, then hit enter. \n');
        end
    end
end
