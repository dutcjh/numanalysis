n = 40; 
x0 = -5; h = 10/n;
X = x0 + h.*(0:n);
Y = 1./(1+X.^2);
m = length(X);
L1 = ones(m,m);
for k = 1:m
    V = 1;
    for i =  1:m
        if k ~= i
            V = conv(V, poly(X(i)))/(X(k)-X(i));
        end
    end
    L1(k,:) = V;
end
C = Y*L1;
% x = -5:0.01:5;
% y1 = polyval(C,x);
% y2 = 1./(1+x.^2);
% plot(x,y2,'LineWidth',2,'Color','b')
% hold on
% plot(x,y1,'LineWidth',2,'Color','r')
% d = y1 - y2;
% hold on
% plot(x,d,'LineWidth',2,'Color','k')
% grid on
% legend('准确值','插值','误差')
polyval(C,4.8)-1/(1+4.8^2)