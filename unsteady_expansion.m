%unsteady expansion

gamma=1.4;
pbypo=linspace(0,1,500);
delubyao_un=(1-pbypo.^((gamma-1)/(2*gamma)))*(2/(gamma-1));
plot(delubyao_un,pbypo);
xlabel('delu/ao');
ylabel('p/po');
title('Unsteady expansion');