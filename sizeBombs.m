function [boardSize,numberBombs] = sizeBombs(difficulty)
if strcmp(difficulty,'easy') == 1
    boardSize = 9;
    numberBombs = 15;
elseif strcmp(difficulty,'medium') == 1
    boardSize = 18;
    numberBombs = 55;
elseif strcmp(difficulty,'hard') == 1
    boardSize = 24;
    numberBombs = 100;
end