function [final_mat] = win2view(input_mat) 
%disp('Enter the Window min coordinate(xwmin, ywmin):');
final_mat = zeros(300,300);
xwmin = 0;
ywmin = 0;
%disp('Enter the Window max coordinate(xwmax, ywmax):');
[xwmax, ywmax] = size(input_mat);
%disp('Enter the Viewport min coordinate(xwmin, ywmin):');
xvmin = 0;
yvmin = 0;
%disp('Enter the Viewport min coordinate(xwmin, ywmin):');
xvmax = 300;
yvmax = 300;

sx = (xvmax-xvmin)/(xwmax-xwmin);
sy = (yvmax - yvmin) /(ywmax - ywmin);

%disp('Enter the Point coordinate(xw , yw ):');
for i = 1:xwmax
    for j = 1:ywmax
        if input_mat(i,j) > 0
        xw = i;
        yw=j;
        xv = (sx*(xw-xwmin))+xvmin;
        xv = round(xv);
        yv = (sy*(yw-ywmin))+yvmin;
        yv = round(yv);
        final_mat(xv,yv)=1;
        end
    end
end
