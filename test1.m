%% �������Դ���
test = 5; % �޸Ĵ˴����Բ�ͬ�ĵ�����
A = hilb(10);
b = A(:,1);
w = 1.2;
e0 = 1e-4;
Nmax = 1000;
x0 = zeros(10,1);
if test == 0
    x = fjacobi(A,b,x0,e0,Nmax)
elseif test == 1
    x = fjacobi2(A,b,x0,e0,Nmax)
elseif test == 2
    x = fgauss(A,b,x0,e0,Nmax)
elseif test == 3
    x = fgauss2(A,b,x0,e0,Nmax)
elseif test == 4
    x = fsor(A,b,x0,e0,w,Nmax)
elseif test == 5
    x = fsor2(A,b,x0,e0,w,Nmax)
end
