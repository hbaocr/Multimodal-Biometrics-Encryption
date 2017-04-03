disp('Enter the fingerprint and iris image to be compared')
prompt = 'Enter the Iris Image:';
Iriss = input(prompt,'s');
prompt = 'Enter the Fingerprint Image:';
fings = input(prompt,'s');
%Iriss = strcat(Iriss,'.jpg')
%fings = strcat(fings,'.png')
Iris_x = Iriss;
fings_x = fings;
[Area_n ,peri_n] = Main_execution(fings_x, Iris_x);

for i = 1:5
   if axy(i) ==  Area_n 
        if pxy(i) == peri_n
            disp(strcat('Match Found at   ',num2str(i)));
            
        end
   end
end