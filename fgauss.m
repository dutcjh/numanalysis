function x = fgauss(A,b,x0,e0,Nmax,varargin)
%% Gauss-Seidel ������
% x0Ϊ��ʼ����ֵ��e0Ϊ���������NmaxΪ����������
n = length(A);
if nargin < 2
    disp('�������̫�٣�');
    x = 0;
    return;
elseif nargin == 2  %���������2������
    x0 = zeros(n,1);
    e0 = 1e-2;
    Nmax = 100;
elseif nargin == 3  %���������3������
    e0 = 1e-2;
    Nmax = 100;
elseif nargin == 4  %���������4������
    Nmax = 100;
end
D = diag(diag(A));
L = triu(A)-A;
U = tril(A)-A;
B = (D-L)\U;
g = (D-L)\b;
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
