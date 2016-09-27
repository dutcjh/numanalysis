%% ��ֵ������һ���ϻ���ҵ
%  �½��� 2016-9-21
%  �й���ѧԺ��ѧ
%% ���þ�����㣬����forѭ��
n = logspace(1,20,20); % n=10^(1~20)
e_cal = (1+1./n).^n; % e�ļ���ֵ
ee = e_cal-exp(1); % �������
%% �����ǻ�ͼ����
loglog(n,abs(ee),'LineWidth',2,'Color','b');
% semilogx(n,ee,'LineWidth',2,'Color','b');
title('����(1+1/n)^{n}����\it{e}\rm�����','FontSize',14);
xlabel('n','FontSize',14);
ylabel('���ľ���ֵ���������꣩','FontSize',14);
grid on;
set(gcf,'WindowStyle','normal');
set(gcf,'Color',[1 1 1],'Position',[200 250 600 400]);
set(findall(gcf,'Type','axes'),'fontsize',14);
%% End