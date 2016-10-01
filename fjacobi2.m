%% jacobi ������
function x = fjacobi2(A,b,x0,e0,Nmax,varargin)
%% jacobi ������
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
x = x0;
for i = 1 : Nmax
    for j = 1 : n
        s = 0;
        for k = 1 : n
            if k ~= j
                s = s + A(j,k)*x0(k);
            end
        end
        x(j) = (b(j)-s)/A(j,j);
    end
    if norm((x-x0),inf) < e0
        i = i-1;
        break
    end
    x0 = x;
end
if i == Nmax
    disp('�����������������ܲ�������');
end
disp(strcat('n = ',num2str(i)));

