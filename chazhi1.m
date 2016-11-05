syms x
f = @(x) x^7+x^4+3*x+1;
sum = 0;
for j = 0:8
    a = 1;
    for i = 0:8
        if i ~= j
            a = a * (2^j-2^i);
        end
    end
    ak = f(2^j)/a
    sum = sum + ak
end
sum