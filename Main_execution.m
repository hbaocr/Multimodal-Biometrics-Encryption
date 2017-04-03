  function [perimeter , Areaa] = Main_execution(finger_image, eye_image)
  finger_image = strcat(finger_image,'.jpg');
[outImg1] = Minutuae_Extraction_seperate(finger_image);
%Minutuae_Extraction_seperate
eye_image = strcat(eye_image,'.jpg');

[temp, mask,polar] =  createiristemplate(eye_image);
[e_row , e_col] = size(temp);
figure;imshow(temp);title('temp');
 [final_out] = win2view(outImg1) ;
  [temp1] = win2view(temp) ;
 
%temp1 = win2view(temp);
final_image = temp1+ final_out;
figure;imshow(final_image);title('final');


[row ,col] = size(final_image);
 threshold = 0.5;
final_ima = zeros(row,col);
%x = zeroes(x);
for i= 1:row
    for j = 1:col
    if final_image(i , j)>threshold 
        final_ima(i,j) = 1;
    end
    end
end
p=1;     

Arrayx = [];
Arrayy = [];
% for i = 1:row
%     for j =1:col
%         if final_ima(i,j)==1
%             Arrayx(p)=i;
%             Arrayy(p)=j;
%             p=p+1;
%         end
%     end
% end
for i=1:row
    for j= 1:col
        if final_ima(i,j) == 1
            Arrayx(p)=i;
            Arrayy(p)=j;
            p=p+1; 
           break;
        end
         
    end
end
for i=row
    for j= col:1
        if final_ima(i,j) == 1
            Arrayx(p)=i;
            Arrayy(p)=j;
            p=p+1;
            break;
        end
        
    end
end
for i= 1:row
    for j=1:col    
        if final_ima(j,i) == 1
            Arrayx(p)=i;
            Arrayy(p)=j;
            p=p+1;
         break;
        end
               
    end
end
for i=row:1
    for j= col:1
        if final_ima(i,j) == 1
            Arrayx(p)=i;
            Arrayy(p)=j;
            p=p+1;
            break;
        end
           
    end
end
[size1, size2] = size(Arrayx);
A = zeros(size2,2);
for i = 1:size2
    A(i,1)=Arrayx(i);
    A(i,2)=Arrayy(i);
end
   

%key Generation Code starts from here.

key = zeros(1 ,256);
p=1;
for i=1:row
    if i > 256
        break;
    end
    count = 0;
    for j = 1:col
        if final_ima(i,j) == 1
       count=count+1;
        end
    end
    key(p) = mod(count,2);
    p=p+1;
end
za = 496; 
zb = 496 ;
%computing the perimeter
%boundingbox = minBoundingBox(A');
% DT = delaunayTriangulation(A);
k = convhull(Arrayx,Arrayy);
plot(Arrayx,Arrayy,'.','markersize',12)
hold on
plot(Arrayx(k),Arrayy(k),'r')
% % corners = detectMinEigenFeatures(final_image); 
% % strong = corners.selectStrongest(70); 
% %  
% % title('final')
% % hold on 
% % plot(strong);
% % coor = strong.Location ;
% % xmin = min(coor(:,1)) ; xmax = max(coor(:,1));
% % ymin = min(coor(:,2)) ; ymax = max(coor(:,2));
% % % Rectangle coordinates
% % O = [xmin,ymin ; xmax ymin ; xmax ymax ; xmin ymax ; xmin ymin] ;
% % plot(O(:,1),O(:,2),'k')
% % hold off;
% figure;
% plot(k);
% hold on 
% 
%  
% line([k(1) k(end)],[1 1]);
 %hold off;
Areaa = polyarea(Arrayx,Arrayy);
perimeter = area(A);
 
%Areaa
% BW = poly2mask(Arrayx,Arrayy,300,300);
%  
% L = bwlabel(BW,4);
%   
% stats = regionprops(L,'Perimeter');
% sstats = size(stats)
% perimeter = 0;
% for i = 1:sstats(1)
%     perimeterr = perimeter;
%     perimeter = stats(i).Perimeter +perimeterr;
% end
%  