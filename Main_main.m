f_img = zeros(1,5);
%fin_img = string(f_img);
iris_img = [];
axy = zeros(1,5);
pxy = zeros(1,5);
%for i = 1:5
 %  fin_img(i) = strcat('fin_img', num2str(i));
  % iris_img(i) = strcat(strcat('iris_img',num2str(i)),'.jpg');
%end


fin_img1 = '2_1.png';
fin_img2 = '2_2.png';
fin_img3 = '2_3.png';
fin_img4 = '2_4.png';
fin_img5 = '2_5.png';

irs_img1 = 'image1.jpg';
irs_img2 = 'image2.jpg';
irs_img3 = 'image3.jpg';
irs_img4 = 'image4.jpg';
irs_img5 = 'image5.jpg';
endp = [341 341 341 73 341 ];
for i =1:5
    iiris = strcat('image',num2str(i));
    ifin = strcat('2_',num2str(i));
    [axy(i), pxy(i)] = Main_execution(ifin,iiris);
    figure(i*2);
    hold on;
    line([1 endp(1)],[1 1]);
    hold off;
end

disp('Database Processing Complete')
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