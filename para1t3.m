Y = zeros(1,101);
Y(1) = 28;
for i = 1:100
    Y(i+1)=Y(i)-27.982/100;
end
disp(Y(end));