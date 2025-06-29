%Robotics arm 2 links project
%Input the links for the robotic arm
link1 =input('Please enter the length of link 1 : ');
link2 =input('Please enter the length of link 2 : ');

%Defining the angles for forward kinematics and spacing them
Angle1 = linspace(0,90,20);
Angle2 = linspace(0,90,20);
 
% Create figure
figure;
grid on;

for i =1:length(Angle1)
        for  j = 1:length(Angle2)
            Ang1=Angle1(i);
            Ang2=Angle2(j);
        

%Forward kinematics--------------------------------------------------------
%initial values
x0=0;
y0=0;
%For the first link
x1 = link1 * cosd(Ang1);      %We use cosd not cos so that we will be able to use in degrees mode
y1 = link1 * sind(Ang1);      %Also here we used sind same as purpose for cosd
%For the second link
x2 = x1 + link2*cosd(Ang1+Ang2);
y2 = y1 + link2*sind(Ang1+Ang2);

%Plotting graph-----------------------------------------------------------
% Clear previous plot
cla;
plot([x0,x1],[y0,y1],'LineWidth',5,'Color','r'); %Link1 to base
hold on
plot([x1,x2],[y1,y2],'LineWidth',5,'Color','r');  %link2 to link1

axis([-10 10 -10 10]);  %setting the range of x and y axes manually for the plot

% Draw current frame
drawnow;

%Animation part---------------------------------------------------------
pause(0.05) %to control ther animation speed by making a short delay between the frames
grid on
  
        end
end

