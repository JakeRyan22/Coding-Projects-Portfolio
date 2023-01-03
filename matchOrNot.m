%checks to see if user found a match and updates graphics, computation
%board accordingly
if cardPicked1 == cardPicked2 %if the user found a match
        memoryBoard{r1,c1} = Blank;
        memoryBoard{r2,c2} = Blank;
        %cards disapear
        memBoardCompute(r1,c1) = 0;
        memBoardCompute(r2,c2) = 0;
        %computation board updates to a zero, used to check if the user won
        %once all matches found sum will be zero
    else 
        %match not found, flip the cards back over
        memoryBoard{r1,c1} = RedDeck{55}; 
        memoryBoard{r2,c2} = RedDeck{55};
    end