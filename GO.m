function GO()
k=1;

while k ~= 6 
    k=menu(' My Package : ' ,'image conversions' ,'point operations', 'geometric operations', 'neighborhood operations', 'frequency domain','Exit'); 
    % this line will show menu for the user and will return k=1 if the user
    % click 'point operations' and will return k=1 if the user click
    % 'geometric operations' and so on note k=6 if the user presses exit
    
     
    switch k
        case 1
            % if the user presses image conversions then k will equal 1 
            % here implement your code 
            % call your function(mfile) and pass the
            % parameters and show the result 
            % note you can show another menu here with the same method to
            % show the functions inside the image conversions like "graytobinary"
           
        case 2
           % implement your code in case that the user presses point
           % operations
        case 3
        case 4
            
        case 5 
             k=menu(' My Package : ' , 'point operations', 'geometric operations', 'neighborhood operations', 'frequency domain','Exit'); 
            % show the menu again so that the user can choose another
            % operation 
    end
end

% once the user clicks exit then the while loop will terminate
% add this file to your work folder and then call "GO" to run this file 
