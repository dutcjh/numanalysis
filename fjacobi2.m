%% jacobi 迭代法
function x = fjacobi2(A,b,x0,e0,Nmax,varargin)
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
    disp('超过迭代次数，可能不收敛！');
end
disp(strcat('n = ',num2str(i)));

