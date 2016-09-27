%% 数值分析第一次上机作业
%  陈建辉 2016-9-21
%  中国科学院大学
%% 利用矩阵计算，避免for循环
n = logspace(1,20,20); % n=10^(1~20)
e_cal = (1+1./n).^n; % e的计算值
ee = e_cal-exp(1); % 计算误差
%% 以下是绘图代码
loglog(n,abs(ee),'LineWidth',2,'Color','b');
% semilogx(n,ee,'LineWidth',2,'Color','b');
title('利用(1+1/n)^{n}计算\it{e}\rm的误差','FontSize',14);
xlabel('n','FontSize',14);
ylabel('误差的绝对值（对数坐标）','FontSize',14);
grid on;
set(gcf,'WindowStyle','normal');
set(gcf,'Color',[1 1 1],'Position',[200 250 600 400]);
set(findall(gcf,'Type','axes'),'fontsize',14);
%% End