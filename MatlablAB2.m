%Matlab Lab2----------
%%Numeric Types--------------------
intVar =10;
doubleVar = 2.4;
disp(['The integer value is :',num2str(intVar)])

disp(['The double value is :',num2str(doubleVar)])

%%Creating Numeric arrays-----------------------------
evenNumbers =2:2:10

primeNumbers = [2;3;5;7;11]


%%Specialised Matrix Function------------------
identityMatrix = eye(3)

magicSquare =magic(2)

%%Matrix Concatenation-------------------------
primeNumbers = primeNumbers';
combinedVector = horzcat(evenNumbers,primeNumbers)


magicSquare(:,3) = [5;6];
combinedMatrix =vertcat(magicSquare,identityMatrix)


  
%End_______________________