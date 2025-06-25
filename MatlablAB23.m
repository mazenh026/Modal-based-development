%Matlab Lab3 ----------------------
%Cell Arrays
cellArray = {'Mazen',[1 2 3],42};
disp(['Cell 1 : ',cellArray{1}]);
disp(['Cell 2 : ',num2str(cellArray{2})]);
disp(['Cell 3 : ',num2str(cellArray{3})]);
%------------------------------------------
%Structures
person.name = 'Mazen';
person.age = 22;
person.city ='Minya El_Qamh';
fprintf(['Person information\n']);
fprintf('Name :%s\n',person.name);
fprintf('Age :%d\n',person.age);
fprintf('City :%s\n',person.city);
%----------------------------------------
%Character Data
str1 = 'Mazen';
str2 = ' loves MBD Diploma';
combinedstring =strcat(str1,str2);
disp(combinedstring);
%----------------------------------------
%Conditional Statementif
x = input('Please enter a number to check :');
if(rem(x,2)) == 0
    disp('This number is even');
else 
    disp('This number is odd');
end
%-----------------------------------------
%For-loops
for x = 1:10
    disp(x);
end
%---------------------------------------
%Basix-Plotting
x = linspace(-2*pi,2*pi,50);
y = sin(x);
plot(x,y);
title('Sin-Plotting');
xlabel('x-axis');
ylabel('y-axis');
legend('Sinwave');
%-------------------------------------------
