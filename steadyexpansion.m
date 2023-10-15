%steady expansion
gamma=1.4;
T=300;
u0=0;

M0=u0/sqrt(gamma*(289)*T);

pbypo=linspace(0,1,500);
delubyao_s=M0+sqrt(M0^2+(2/(gamma-1))*(1-pbypo.^((gamma-1)/gamma)));
plot(delubyao_s,pbypo);
xlabel('delu/ao');
ylabel('p/po');
title('Steady expansion');