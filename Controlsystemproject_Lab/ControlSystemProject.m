new_system('ControlSystemProject')

%Adding Blocks
add_block('simulink/Commonly Used Blocks/Scope','ControlSystemProject/Scope1')
add_block('simulink/Sources/Step','ControlSystemProject/Step_input')
add_block('simulink/Commonly Used Blocks/Gain','ControlSystemProject/kp_gain')
add_block('simulink/Commonly Used Blocks/Gain','ControlSystemProject/ki_gain')
add_block('simulink/Commonly Used Blocks/Gain','ControlSystemProject/kd_gain')
add_block('simulink/Commonly Used Blocks/Integrator','ControlSystemProject/integrator')
add_block('simulink/Continuous/Derivative','ControlSystemProject/derivative')
add_block('simulink/Commonly Used Blocks/Sum','ControlSystemProject/Sum_1')
add_block('simulink/Commonly Used Blocks/Sum','ControlSystemProject/Sum_2')
add_block('simulink/Continuous/Transfer Fcn','ControlSystemProject/T_F')

%Editing Paramters
set_param('ControlSystemProject/Sum_1','Inputs','|+-')
set_param('ControlSystemProject/Sum_2','Inputs','+++')
set_param('ControlSystemProject/T_F','Numerator','[0.01]')
set_param('ControlSystemProject/T_F','Denominator','[1 0.3 0.01]')
set_param('ControlSystemProject/kp_gain','Gain','2')
set_param('ControlSystemProject/ki_gain','Gain','0.1')
set_param('ControlSystemProject/kd_gain','Gain','1e-9')
set_param('ControlSystemProject','stopTime','100')

%Connecting Lines
add_line('ControlSystemProject','Step_input/1','Sum_1/1')
add_line('ControlSystemProject','Sum_1/1','kp_gain/1')
add_line('ControlSystemProject','Sum_1/1','ki_gain/1')
add_line('ControlSystemProject','Sum_1/1','kd_gain/1')
add_line('ControlSystemProject','kp_gain/1','Sum_2/1')
add_line('ControlSystemProject','ki_gain/1','integrator/1')
add_line('ControlSystemProject','kd_gain/1','derivative/1')
add_line('ControlSystemProject','integrator/1','Sum_2/2')
add_line('ControlSystemProject','derivative/1','Sum_2/3')
add_line('ControlSystemProject','Sum_2/1','T_F/1')
add_line('ControlSystemProject','T_F/1','Sum_1/2')
add_line('ControlSystemProject','T_F/1','Scope1/1')


sim('ControlSystemProject')
open_system('ControlSystemProject/Scope1')


