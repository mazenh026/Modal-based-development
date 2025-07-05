s_m =35;
l_t=30;
u_t=70;
mdl=gcs;
lengthvalues=20:4:50;
for i = 1:numel(lengthvalues)
  s_m=lengthvalues(i);
  result=sim(mdl);
end