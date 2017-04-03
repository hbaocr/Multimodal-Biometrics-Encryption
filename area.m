function [P] = area(A)
 perimeter = 0;

for i = 1:size(A, 1)-1

perimeter = perimeter + norm(A(i, :) - A(i+1, :));

end

perimeter = perimeter + norm(A(end, :) - A(1, :)); % Last point to first
 
Ndecimals=3;
f = 10.^Ndecimals ;
P = round(f*perimeter)/f;

fprintf('The perimeter of the polygon is %.3f\n', perimeter)