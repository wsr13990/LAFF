function[y_out] = matvec(A,x,y)

n = size(A,1);
for j = 1:n
    for i = 1:j-1
        y(j) = A(j,i)*x(i)+y(j);
    end
    y(j) = A(j,j)*x(j)+y(j);
    for i = j+1:n
        y(j) = A(i,j)*x(i)+y(j);
    end
end
y_out = y;
return



