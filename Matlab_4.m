%Matlab 3-----------------------------
%%
%Task 1 : While loop---------------------------------
count = 2                 %Begining of the count
while count <= 20         %While loop
    x =input('Please input the number : ') %Asking the user for the number
    if rem(count,2)==0    %conditionn check for even numbers
        disp(count);
    end               
Factorial = factorial(x); %Function used to calculate factorial
disp(Factorial);    
count = count+1; %keeps increasing the count to end while at some point
end
%%
%Task 2 : Switch statement-----------------------------
disp('Options of travelling is car or bus or train or airplane');
Mode_Trip = input('Please enter way of travelling ','s');
Miles = input('Please input number of miles you travlling ');
switch Mode_Trip
    case 'car'
        fprintf('The cost per mile for car is :%d%s\n',20,' pounds');
        fprintf('so the total cost is :%d%s\n',20*Miles,' pounds');
    case 'bus'
        fprintf('The cost per mile for bus is :%d%s\n',10,' pounds');
        fprintf('so the total cost is :%d%s\n',10*Miles,' pounds');
    case  'train'
        fprintf('The cost per mile for train is :%d%s\n',30,' pounds');
        fprintf('so the total cost is :%d%s\n',30*Miles,' pounds');
    case 'airplane'
        fprintf('The cost per mile for airplane is :%d%s\n',50,' pounds');
        fprintf('so the total cost is :%d%s\n',50*Miles,' pounds');
    otherwise
        disp('Please choose on of the options and please type correctly');
end
%-------------------------------------------------------------------------
disp('  please enter code for  colors [R G B]');
R = input('The code of red : ');
G = input('The code of green : ');
B = input('The code of blue is : ');
color_code = [R G B];%converting them to row vector for compare 

switch mat2str(color_code) %mat2str to convert it to string for compare
    case mat2str([1 0 0])
        disp('Red');
    case mat2str([0 1 0])
        disp('Green');
     case mat2str([0 0 1])
        disp('Blue');
    otherwise
        disp('Unknown color');
end
%%
%End---------------------------------------------------------------------






