function T = t_pipe(x)
% 地下x米深处土壤温度
Ti = 20;            %正常土壤温度
Ts = -15;           %寒冷季节地面温度
tm = 60;            %寒冷持续天数
alpha = 0.138e-6;
t = tm * 24 * 60 * 60;  %将时间单位换算为秒
c = 2 * sqrt(alpha * t);
T = Ts + (Ti -Ts) * erf(x/c);