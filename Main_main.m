 f_img = zeros(1,5);
%fin_img = string(f_img);
iris_img = [];
axy = zeros(1,5);
pxy = zeros(1,5);
%for i = 1:5
 %  fin_img(i) = strcat('fin_img', num2str(i));
  % iris_img(i) = strcat(strcat('iris_img',num2str(i)),'.jpg');
%end


fin_img1 = 'fin_test1.jpg';
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
    ifin = strcat('fin_test',num2str(i));
    [ pxy(i),axy(i)] = Main_execution(ifin,iiris);
    pxy(1);
%     figure(2);
%     hold on;
%     line([1 endp(1)],[1 1]);
%     hold off;
 end

disp('Database Processing Complete')
disp('Enter the fingerprint and iris image to be compared')
prompt = 'Enter the Iris Image:';
Iriss = input(prompt,'s');
prompt = 'Enter the Fingerprint Image:';
fings = input(prompt,'s');
%Iriss = strcat(Iriss,'.jpg')
%fings = strcat(fings,'.jpg')
Iris_x = Iriss;
fings_x = fings;
[Area_n ,peri_n] = Main_execution(fings_x, Iris_x);
x=0;
for i = 1:5
   if axy(i) ==   peri_n
        if pxy(i) == Area_n
            disp(strcat('Match Found at  : ' , num2str(i)));
            x=1;
        end
   end
end
if x==0
   disp('No Match Found.') 
end