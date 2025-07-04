l=1
g=9.81
b=0.5

mdl=gcs;
lengthValues =1:2:11;
for i=1:numel(lengthValues)
      l=lengthValues(i);
      result = sim(mdl);
      plot(result.logsout.get(1).Values);
      hold on  
      disp("Simulation"+num2str(i)+"complete")
      Legendlabels{i}= "l "+num2str(i);
end
legend(Legendlabels);

