function x = fgauss2(A,b,x0,e0,Nmax,varargin)
%% Gauss-Seidel 迭代法
% x0为初始迭代值，e0为最大允许误差，Nmax为最大迭代次数
n = length(A);
if nargin < 2
    disp('输入参数太少！');
    x = 0;
    return;
elseif nargin == 2  %如果输入了2个参数
    x0 = zeros(n,1);
    e0 = 1e-2;
    Nmax = 100;
elseif nargin == 3  %如果输入了3个参数
    e0 = 1e-2;
    Nmax = 100;
elseif nargin == 4  %如果输入了4个参数
    Nmax = 100;
end
x = x0;
for k = 1 : Nmax
    for j = 1 : n
        if j == 1
            x(1) = (b(1) - A(1,2:n)*x0(2:n))/A(1,1);
        elseif j == n
            x(n) = (b(n) - A(n,1:n-1)*(x(1:n-1)))/A(n,n);
        else
            x(j) = (b(j) - A(j,1:j-1)*(x(1:j-1))-A(j,j+1:n)*x0(j+1:n))/A(j,j);
        end
    end
    if norm((x-x0),inf) < e0
        k = k-1;
        break
    end
    x0 = x;
end
if k == Nmax
    disp('超过迭代次数，可能不收敛！');
end
disp(strcat('n = ',num2str(k)));

