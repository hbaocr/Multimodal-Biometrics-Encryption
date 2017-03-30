function [perimeter , Areaa] = Main_execution(finger_image, eye_image)
finger_image = strcat(finger_image,'.png');
[outImg1] = Minutuae_Extraction_seperate(finger_image);
%Minutuae_Extraction_seperate
eye_image = strcat(eye_image,'.jpg');
[temp, mask] =  createiristemplate(eye_image);
 figure;imshow(temp);title('temp');
 final_out = outImg1 ;
[row1 ,col1] = size(outImg1);
temp1 = imresize(temp, [row1 col1]);
final_image = temp1+ final_out;

figure;imshow(final_image);title('final');
[row ,col] = size(final_image);
threshold = 0.5;
final_ima = zeros(row,col);
%x = zeroes(x);
for i= 1:row
    for j = 1:col
    if final_image(i , j)>=threshold 
        final_ima(i,j) = 1;
    end
    end
end
p=1;     

Arrayx = [];
Arrayy = [];
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
for i= 1:col
    for j=1:row    
        if final_ima(i,j) == 1
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
za = 516; 
zb = 516 ;
%computing the perimeter
boundingbox = minBoundingBox(A');
k = convhull(Arrayx,Arrayy);
plot(k);
hold on 
k(1) 
k(end)
 
line([k(1) k(end)],[1 1]);
hold off;
Areaa = polyarea(Arrayx,Arrayy);
BW = poly2mask(Arrayx,Arrayy,za,zb);
L = bwlabel(BW);
stats = regionprops(L,'Perimeter');
sstats = size(stats);
perimeter = 0;
for i = 1:sstats(1)
    perimeterr = perimeter;
    perimeter = stats(i).Perimeter +perimeterr;
end

