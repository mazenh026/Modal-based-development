
% Matlab 5 --------------------------------
% Task 1: Creating a simple function ----------------------------------------

disp('Please enter two numbers');
num1 = input('Please enter number 1: ');   % Asking the user to input first number
num2 = input('Please enter number 2: ');   % Asking the user to input second number

sum_result = mysimplefunction(num1, num2);  % Calling the function and storing the output
disp(['The sum is: ', num2str(sum_result)]);  % Displaying the result

% -------------------------------------------------------------------------
% Task 2: Function Inputs and Outputs ---------------------------------------

radius_cir = input('Please enter radius of circle: ');  % Inputting the radius
area_result = circleradius(radius_cir);                 % Calling the function
disp(['Area of the circle: ', num2str(area_result)]);   % Displaying the area

% --------------------------------------------------------------------------
% Task 3: Function with Multiple Outputs -----------------------------------

x = input('Please enter a row vector (e.g., [1 2 3]): ');  % Getting vector from user
[m, sd] = computeStatistics(x);                           % Calling function

disp(['Mean = ', num2str(m)]);                           %diplaying the result of mean
disp(['Standard Deviation = ', num2str(sd)]);            %displaying the result of standard deviation

% --------------------------------------------------------------------------
% Task 4: Nested Functions -------------------------------------------------

x1 = input('Please enter first number :');      %asking the user to input the first number
x2 = input('Please enter second number :');     %asking the user to input the second number
sum_result = outerfunction(x1, x2);             %calling the outerfunction
disp(['The sum of two number is :', num2str(sum_result)]);    %displaying the result

% --------------------------------------------------------------------------
% Task 5: Function handle with switch-case ---------------------------------

choice = lower(input('Please input a choice (sqrt, cube) : ', 's'));  % Convert to lowercase
y = input('Please enter a row vector (e.g., [1 2 3]): ');  % Getting vector from user
output = functionhandle(choice, y);
disp(['Output :',num2str(output)]);
%-------------------------------------------------------------------------
%Task 6:Anonymous Functions-----------------------------------------------
base=input('Please input the base of triangle : ');   %asking the user to input the base
height=input('Please input the height of triagle : ');  %asking the user to input the height
Area_Triangle=calculatearea(base,height);               %calling the function
disp(['The area of triangle is: ',num2str(Area_Triangle)]);   %displaying the result
%---------------------------------------------------------------------------
%Task 7:Using Built-in Functions
h = input('Please enter a row vector (e.g., [1 2 3]): ');  % Getting vector from user
[Maxvec,Minvec,Sumvec] = builtinfunction(h);               %calling thee function
disp(['The maximum number is :',num2str(Maxvec)]);          %displaying the maximum value
disp(['The minumum number is :',num2str(Minvec)]);          %diplaying thr minumum value
disp(['The sum of the values is :',num2str(Sumvec)]);       %displaying the sum of values

%Functions ----------------------------------------------------------------
%Function task1-----------------------------------------------------------
function sum_result = mysimplefunction(a, b)     %inputting the values
    sum_result = a + b;                          %calculating sum
end
%Function task2-----------------------------------------------------------
function Area = circleradius(r)                  %inputting the radius to calculate the area
    Area = pi * r^2;                             %calculating the area of the circle
end                                               
%Function task3---------------------------------------------------------- 
function [m, sd] = computeStatistics(vec)       %inputting the vector to the function
    m = mean(vec);                              %calculating the mean
    sd = std(vec);                              %calculating standard deviation
end
%Funcion task4-------------------------------------------------------------
function sum_res = outerfunction(x1, x2)         %inputting values to the outer function
    function sum = innerfunction(a, b)           %uploading the values to the inner function
         sum = a + b;                          %calculating sum of the values
    end
    sum_res = innerfunction(x1, x2);             %calling the inner function
end
%Function task5------------------------------------------------------------
function output = functionhandle(choice, y)  %inputting choice and the vector
    switch choice         
        case 'sqrt'                         %first choice
            f = @(x) sqrt(x);               %using anonymous function
        case 'cube'                         %second function
            f = @(x) x.^3;
        otherwise
            disp('Invalid choice');
            return;
    end
    output = arrayfun(f, y);                     %to apply on each element
end
%Function task6-----------------------------------------------------------
function Area_Triangle = calculatearea(base,height)  %inputting the bse and height tto function
     res=@(b,h) 0.5 *b*h;                    %using anonymous to calcute area of triangle
     Area_Triangle = res(base,height);       %calling the anonymous   
end
%Function task7--------------------------------------------------------
function [Maxvec,Minvec,Sumvec] = builtinfunction(h)      %inputting the values to thee function
           Maxvec = max(h);                               %built in function to calculate maximum
           Minvec = min(h);                               %built in function to calculate minumum value
           Sumvec = sum(h);                               %built in function to calculate the sum of values 
end












