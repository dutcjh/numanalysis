function x = fjacobi(A,b,x0,e0,Nmax,varargin)
%% jacobi 迭代法
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
I = eye(n);
D = diag(diag(A));
B = I - D\A;
g = D\b;
xk=x0;
n = 1;
xk1 = B*xk+g;
while n < Nmax %迭代次数上限
    xk = xk1;
    n = n+1;
    xk1 = B*xk+g;
    if max(abs(xk1-xk))<e0
        break;
    end
end
disp(strcat('n=',num2str(n)));
x = xk1;
