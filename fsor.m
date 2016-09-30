function x = fsor(A,b,x0,e0,w,Nmax,varargin)
%% SOR（逐次超松弛迭代法）
% x0为初始迭代值，e0为最大允许误差，Nmax为最大迭代次数
n = length(A);
if nargin < 2
    disp('输入参数太少！');
    x = 0;
    return;
elseif nargin == 2  %如果输入了2个参数
    x0 = zeros(n,1);
    e0 = 1e-2;
    w = 1;
    Nmax = 100;
elseif nargin == 3  %如果输入了3个参数
    e0 = 1e-2;
    w = 1;
    Nmax = 100;
elseif nargin == 4 %如果输入了4个参数
    w = 1;
    Nmax = 100;
elseif nargin == 5 %如果输入了5个参数
    Nmax = 100;
end
D = diag(diag(A));
L = triu(A)-A;
U = tril(A)-A;
M = D./w-L;
N = (1/w-1).*D+U;
B = M\N;
g = M\b;
xk=x0;
n = 1;
xk1 = B*xk+g;
while n < Nmax
    xk = xk1;
    n = n+1;
    xk1 = B*xk+g;
    if max(abs(xk1-xk))<e0
        break;
    end
end
disp(strcat('n=',num2str(n)));
x = xk1;

