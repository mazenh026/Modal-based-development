% Advanced Simulink Scripting Lab

% Clear environment
clc
clear

%Dynamic Block Creation
% Create a new model and add a subsystem with Gain and Scope

modelName = 'AdvancedLabModel';
new_system(modelName);
open_system(modelName);

% Add subsystem
add_block('simulink/Ports & Subsystems/Subsystem', [modelName '/DynamicSubsystem']);
open_system([modelName '/DynamicSubsystem']);

% Remove default In/Out
delete_block([modelName '/DynamicSubsystem/In1']);
delete_block([modelName '/DynamicSubsystem/Out1']);

% Add blocks inside subsystem
gainBlock = add_block('simulink/Math Operations/Gain',[modelName '/DynamicSubsystem/DynamicGain']);
scopeBlock = add_block('simulink/Sinks/Scope',[modelName '/DynamicSubsystem/DynamicScope']);
inBlock = add_block('simulink/Sources/Sine Wave',[modelName '/DynamicSubsystem/InputSignal']);

% Connect blocks
add_line([modelName '/DynamicSubsystem'], 'InputSignal/1', 'DynamicGain/1');
add_line([modelName '/DynamicSubsystem'], 'DynamicGain/1', 'DynamicScope/1');
% Parameter Sweep  
% Add To Workspace block for Gain output
toWsBlock = add_block('simulink/Sinks/To Workspace',[modelName '/DynamicSubsystem/GainOutput'], 'MakeNameUnique','on');

% Configure To Workspace block
set_param(toWsBlock, 'VariableName', 'GainOutput', 'SaveFormat','StructureWithTime');

% Connect Gain -> To Workspace
add_line([modelName '/DynamicSubsystem'], 'DynamicGain/1', 'GainOutput/1');

% Update diagram so new block connections are applied
set_param(modelName, 'SimulationCommand', 'update');

% Define results container
gainValues = 1:2:9;
results = struct();

for i = 1:length(gainValues)
    % Update Gain value
    set_param(gainBlock, 'Gain', num2str(gainValues(i)));

    % Run simulation and capture outputs
    simOut = sim(modelName, 'StopTime', '10');

    % Retrieve data directly from simOut (no base workspace)
    gainStruct = simOut.get('GainOutput');
    gainData   = gainStruct.signals.values;
    timeData   = gainStruct.time;

    % Store results
    results(i).Gain = gainValues(i);
    results(i).PeakOutput = max(gainData);
end

disp('Parameter sweep results:');
disp(results);


%Automated Simulation Setup
% Configure solver and stop time

set_param(modelName, 'Solver', 'ode45');
set_param(modelName, 'StopTime', '10');

%Data Logging

set_param(modelName, 'SignalLogging', 'on');


