playAgain = 1;
while playAgain == 1

    warning off 'all' %code produced annoying warning when graphics were updated, this turns it off
    clear; clc; close all;
    msg1 = errordlg(['IMPORTANT: There are no control prompts for this game, so make sure you remember this. ' ...
        'Controls: First, click on a tile when the crosshair appears to select it. Next, hit "r" on your ' ...
        'keyboard to reveal the selected tile, or "f" to flag/unflag it. If you forget the controls, ' ...
        'then you can minimize the game figrue to see what the command window says. SELECT DIFFICULTY IN TOP LEFT TO CONTINUE']);
    %There are no conrol prompts in the game because the game looks much better
    %when left undocked, but doing so hides the command window. We did not want
    %to put message boxes for the input prompts either because that would slow
    %the game down, and minesweeper is a time based game with lots of inputs so
    %this would really bring the quality of the gameplay down. Once the user
    %learns the controls (which are very simple, and should only take a game or
    %two), this is well worth the slight initial confusion.

    difficultySelect; %script with buttons to choose difficulty
    load minesweeper.mat;
    figure('Name','Minesweeper','NumberTitle','off','Color','b')
    %makes background blue, and changes the title of the figure game will be played on
    [boardSize, numberBombs] = sizeBombs(difficulty); %fn computes difficulty for board size and number of bombs
    boardGen = createboard(boardSize,numberBombs); %fn randomly generates minesweeper board matrix, explaind further within fn
    flags = zeros(boardSize); %flags matrix that keeps track of where flags are placed
    winCheck = zeros(boardSize); %winCheck keeps track of revealed tiles, also used to check win condition
    gameOver = 0; %tracks lose condition (user hits bomb)
    condition = logical(true); %used for game loop, stays true if user hasn't won or lost yet
    elapsedTotal = 0;
    songCycle = 0;
    [y, Fs] = audioread('Main Theme - Microsoft Minesweeper.wav');
    song = audioplayer(y,Fs);
    % Saves as song using sampling rate, Fs
    graphicsInitialization; %script that makes blank board to display
    play(song) % plays song
    while condition %main game loop
        tic;
        disp('Click on a tile to select it.')
        [x,y] = ginput(1);
        row = floor(y/100) + 1;
        col = floor(x/100) + 1;
        %initial input (user clicks on tile)
        check = 0;
        while check == 0
            if row < 1 || row > boardSize || col < 1 || col > boardSize
                err1 = errordlg('Invalid tile, please click on the board'); pause(.75);
                [x,y] = ginput(1);
                row = floor(y/100) + 1;
                col = floor(x/100) + 1;
            elseif winCheck(row,col) == 1
                err = errordlg('Invalid tile, please click a tile that is not revealed yet.'); pause(.75);
                [x,y] = ginput(1);
                row = floor(y/100) + 1;
                col = floor(x/100) + 1;
            else
                check = 1;
            end
        end
        %makes sure user input is valid

        computeInput; %reveals or flags tiles - explained in further detail within script

        if gameOver == 1 || sum(winCheck,'all') == boardSize^2 - numberBombs
            condition = false;
        end
        %Checks to see if user won or lost on recent turn, breaks loop if so
        dispGraphics; %script that updates board
        elapsedLoop = toc;
        elapsedTotal = elapsedTotal + elapsedLoop; %timer code, adds together the time elapsed in each loop
        songCycle = songCycle + elapsedLoop; %how long song has played for
        if songCycle > 110 %if song played longer than 110 seconds
            stop(song)
            play(song)
            songCycle = 0;
            %restarts song
        end

    end

    elapsedTotal = floor(elapsedTotal) + 1;
    elapsedMinutes = floor(elapsedTotal/60);
    elapsedSeconds = rem(elapsedTotal,60);
    %converts the elapsed time you got from scientific notation to minutes
    %and seconds rounded up

    [y, Fs] = audioread("Victory Sound Effect.wav");
    winEffect = audioplayer(y,Fs);
    [y, Fs] = audioread("You Lose Sound Effect.wav");
    loseEffect = audioplayer(y,Fs);
    %initializes sound effects for winning and losing

    %prints win or lose based on if bomb was hit in the main game loop
    if gameOver == 1
        fprintf('You lasted %d minutes and %d seconds before blowing yourself up, you lose. \n', elapsedMinutes, elapsedSeconds)
        stop(song) %stops main theme
        play(loseEffect) %plays lose sound
        displayAllBombs; %shows where all bombs are (tells user where they went wrong)
    else
        fprintf('Congratulations! You found all the bombs in %d minutes and %d seconds - you win! \n', elapsedMinutes, elapsedSeconds)
        stop(song) %stops main theme
        play(winEffect) %plays win sound
    end
   
    pause(1); % 1 second delay for displayallbombs animation to have buffer time after it finishes
    close(1); %closes the game figure
    msg1 = msgbox('Your time is in the command window');
    pause(2); %gives user time to read msg before it closes
    close(msg1);

    playAgain = input('Would you like to play again? Type 1 for yes or 0 for no, then hit enter. \n');
    %a way for the user to play the game again without restarting the code
    check = 0;
    while check == 0
        if playAgain == 0 || playAgain == 1
            check = 1;
        else
            playAgain = input('Invalid input, please try again. Type 1 to play again, or a 0 to stop playing, then hit enter. \n');
        end
    end
end