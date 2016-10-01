function x = fgauss(A,b,x0,e0,Nmax,varargin)
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
D = diag(diag(A));
L = triu(A)-A;
U = tril(A)-A;
B = (D-L)\U;
g = (D-L)\b;
xk1=x0;
n = 0;
while n < Nmax
    xk = xk1;
    xk1 = B*xk+g;
    if norm((xk1-xk),inf)<e0
        break;
    end
    n = n+1;
end
if n >= Nmax
    disp('超过迭代次数，可能不收敛！');
end
disp(strcat('n = ',num2str(n)));
x = xk1;
