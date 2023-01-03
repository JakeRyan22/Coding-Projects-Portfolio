button{1} = 'Easy';
button{2} = 'Medium';
button{3} = 'Hard';
boardDifficulty = menu('Please select a Difficulty', button{1}, button{2}, button{3});
if boardDifficulty == 1
    difficulty = 'easy';
elseif boardDifficulty == 2
    difficulty = 'medium';
elseif boardDifficulty == 3
    difficulty = 'hard';
end