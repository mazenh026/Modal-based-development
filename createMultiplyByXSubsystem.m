function createMultiplyByXSubsystem(modelName, xValue)
    % Create a new Simulink model
    new_system(modelName);
    open_system(modelName);

    % Add a Subsystem block
       add_block('simulink/Ports & Subsystems/Subsystem', [modelName '/MultiplyByX']);

    % Add gain inside subsystem
    add_block('simulink/Math Operations/Gain', [modelName '/MultiplyByX/Gain']);
   

    % Set the gain value
    set_param([modelName '/MultiplyByX/Gain'], 'Gain', num2str(xValue));

    % Connect blocks
    add_line([modelName '/MultiplyByX'], 'In1/1', 'Gain/1');
    delete_line([modelName '/MultiplyByX'], 'In1/1', 'Out1/1')
    add_line([modelName '/MultiplyByX'], 'Gain/1', 'Out1/1');
end
