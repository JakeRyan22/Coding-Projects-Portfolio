function check = checkInputD(difficulty)
if  strcmp(difficulty,'easy') == 1 || strcmp(difficulty,'medium') == 1|| strcmp(difficulty,'hard') == 1
    check = 1;
else
    disp('Error: please input a valid difficulty')
    check = 0;
end