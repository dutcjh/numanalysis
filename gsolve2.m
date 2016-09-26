%% 高斯消去法(列主元技术）
%  输入参数矩阵A，右端系数行向量b
%  输出结果列向量x,出错输出-1或-2
%  精度更高！！！
% 示例:
%   A = magic(13)
%   b = 1:13
%   gsolve2(A, b)
%%
function x = gsolve2(A,b)
n = length(A);
A = [A,b'];
for k = 1:1:(n-1)
    [Y,I] = max(abs(A(k:end,k)));
    if Y == 0
        x = -1;
        return;
    end
    Y = A(k,:);
    A(k,:) = A(I+k-1,:);
    A(I+k-1,:) = Y;
end
for k = 1:1:(n-1)
    c = -A(k+1:end,k)./A(k,k);
    A(k+1:end,:) = A(k+1:end,:)+c*A(k,:);
end
U = A(:,1:end-1);
x = A(:,end);
for i = n:-1:1
    if U(i,i) == 0
        x = -2;
        return;
    end
    x(i) = (x(i) - U(i,i+1:n)*x(i+1:n))/U(i,i);
end
