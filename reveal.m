function [mineSweeperGraphics,MineSweeperBoard] = reveal(row,col,boardGen,mineSweeperGraphics,MineSweeperBoard)
%essentially takes input of row and column and reveals hidden value in the 
%board that was randomly generated on the graphics board for that index

MineSweeperBoard{row,col} = mineSweeperGraphics{boardGen(row,col) + 1};


%note about development

%we use boardGen(row,col) + 1 becasue when we made the graphics file there cannot be
%a 0th element of a cell array, and our values in boardGen range from 0
%to 9. We strategically ordered our cell array so that graphical elements 1 - 10
%corresponded to the numerical value of boardGen + 1 to make the
%implementation of the graphics as seamless as possible. Values 11 and 12
%of our graphics cell array correspond to flags and blank unrevealed tiles,
%which are computed independent of boardGen within the computeInput script.