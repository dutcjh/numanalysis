function T = t_pipe(x)
% ����x��������¶�
Ti = 20;            %���������¶�
Ts = -15;           %���伾�ڵ����¶�
tm = 60;            %�����������
alpha = 0.138e-6;
t = tm * 24 * 60 * 60;  %��ʱ�䵥λ����Ϊ��
c = 2 * sqrt(alpha * t);
T = Ts + (Ti -Ts) * erf(x/c);