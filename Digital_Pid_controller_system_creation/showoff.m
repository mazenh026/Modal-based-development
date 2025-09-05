Blocks = find_system('PID_model_system_creation/Digital_PID_Controller','regexp','on','BlockType','.*')
for i = 1: length(Blocks)
    set_param(Blocks{i},'ShowName','off')
end
