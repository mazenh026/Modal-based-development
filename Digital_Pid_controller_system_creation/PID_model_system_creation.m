% Create new model
new_system('PID_model_system_creation');
open_system('PID_model_system_creation');

% Add Subsystem
add_block('simulink/Ports & Subsystems/Subsystem', 'PID_model_system_creation/Digital_PID_Controller');
open_system('PID_model_system_creation/Digital_PID_Controller');

% Delete default in/out
delete_block('PID_model_system_creation/Digital_PID_Controller/In1');
delete_block('PID_model_system_creation/Digital_PID_Controller/Out1');

% Add I/O Ports 
add_block('simulink/Sources/In1', 'PID_model_system_creation/Digital_PID_Controller/Desired_Sig');
add_block('simulink/Sources/In1', 'PID_model_system_creation/Digital_PID_Controller/Actual_Sig');
add_block('simulink/Sinks/Out1',  'PID_model_system_creation/Digital_PID_Controller/Ctrl_Action');

%Error signal
add_block('simulink/Math Operations/Sum', 'PID_model_system_creation/Digital_PID_Controller/Error_Sum', 'Inputs', '+-');
set_param('PID_model_system_creation/Digital_PID_Controller/Error_Sum','Inputs','+-')
%P controller
add_block('simulink/Math Operations/Gain', 'PID_model_system_creation/Digital_PID_Controller/Kp_Gain');
set_param('PID_model_system_creation/Digital_PID_Controller/Kp_Gain', 'Gain', 'K_p');

% I Branch 
add_block('simulink/Math Operations/Gain', 'PID_model_system_creation/Digital_PID_Controller/Ki_Gain');
set_param('PID_model_system_creation/Digital_PID_Controller/Ki_Gain', 'Gain', 'Ki');
add_block('simulink/Math Operations/Gain', 'PID_model_system_creation/Digital_PID_Controller/Sample_Time');
set_param('PID_model_system_creation/Digital_PID_Controller/Sample_Time', 'Gain', 'Ts');
add_block('simulink/Discrete/Unit Delay', 'PID_model_system_creation/Digital_PID_Controller/Delay1');
add_block('simulink/Discrete/Unit Delay', 'PID_model_system_creation/Digital_PID_Controller/Delay2');
add_block('simulink/Math Operations/Add','PID_model_system_creation/Digital_PID_Controller/Add1')
set_param('PID_model_system_creation/Digital_PID_Controller/Delay2','orientation','left')
% D Branch 
add_block('simulink/Math Operations/Add', 'PID_model_system_creation/Digital_PID_Controller/Diff', 'Inputs', '-+');
add_block('simulink/Math Operations/Gain', 'PID_model_system_creation/Digital_PID_Controller/Kd_Gain');
set_param('PID_model_system_creation/Digital_PID_Controller/Kd_Gain', 'Gain', 'Kd');
add_block('simulink/Math Operations/Gain', 'PID_model_system_creation/Digital_PID_Controller/Ts_Reciprocal');
set_param('PID_model_system_creation/Digital_PID_Controller/Ts_Reciprocal', 'Gain', '1/Ts');

% Sum P+I+D 
add_block('simulink/Math Operations/Add', 'PID_model_system_creation/Digital_PID_Controller/Sum_PID', 'Inputs', '+++');

%Connection blocks
add_line('PID_model_system_creation/Digital_PID_Controller', 'Desired_Sig/1', 'Error_Sum/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Actual_Sig/1', 'Error_Sum/2');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Error_Sum/1', 'Kp_Gain/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Kp_Gain/1', 'Sum_PID/1')
add_line('PID_model_system_creation/Digital_PID_Controller', 'Error_Sum/1', 'Delay1/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Delay1/1', 'Ki_Gain/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Ki_Gain/1', 'Sample_Time/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Sample_Time/1', 'Add1/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Add1/1', 'Sum_PID/2');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Add1/1', 'Delay2/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Delay2/1', 'Add1/2');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Delay1/1', 'Diff/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Diff/1', 'Kd_Gain/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Kd_Gain/1', 'Ts_Reciprocal/1');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Ts_Reciprocal/1', 'Sum_PID/3');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Error_Sum/1', 'Diff/2');
add_line('PID_model_system_creation/Digital_PID_Controller', 'Sum_PID/1', 'Ctrl_Action/1');

