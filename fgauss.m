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
    disp('�����������������ܲ�������');
end
disp(strcat('n = ',num2str(n)));
x = xk1;
