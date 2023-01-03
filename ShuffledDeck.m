%creates a random hidden board of pairs that is used for the game logic
rng shuffle
cards = randperm(13,8); %creates 8 random cards (not repeated) that will be pairs 
counter = 1;
cardPairs = zeros(1,16);
for i = 1:8
    cardPairs(i) = cards(i); %first 8 cards randomly selected
end
for i = 1:8
    cardPairs(i+8) = cards(i); %duplicates selected cards (makes pairs)
end
randomizeOrder = randperm(16); %used to randomize card placement in the memory board

memBoardCompute = zeros(4); 
for r = 1:4
    for c = 1:4
         memBoardCompute(r,c) = cardPairs(randomizeOrder(counter));
         counter = counter + 1;
    end
end
%creates hidden values of cards that user can't see (used for computation)