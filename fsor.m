function x = fsor(A,b,x0,e0,w,Nmax,varargin)
%% SOR����γ��ɳڵ�������
% x0Ϊ��ʼ����ֵ��e0Ϊ���������NmaxΪ����������
n = length(A);
if nargin < 2
    disp('�������̫�٣�');
    x = 0;
    return;
elseif nargin == 2  %���������2������
    x0 = zeros(n,1);
    e0 = 1e-2;
    w = 1;
    Nmax = 100;
elseif nargin == 3  %���������3������
    e0 = 1e-2;
    w = 1;
    Nmax = 100;
elseif nargin == 4 %���������4������
    w = 1;
    Nmax = 100;
elseif nargin == 5 %���������5������
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

