clear;
clc; 

Ms=5;
g=[5/3 7/5];
p2_p1=1+(2.*g./(g+1)).*(Ms.^2-1);
 
for g=[5/3 7/5]
    delu_a1_12=linspace(0,10,1000);
    p_p1_12=1+(g.*delu_a1_12).*((g+1)*0.25.*delu_a1_12+sqrt(1+(g+1)^2*0.25^2.*delu_a1_12.^2));
    u_a1_12=delu_a1_12;
    plot(u_a1_12,p_p1_12,'DisplayName',['\gamma=' num2str(g)]);
    hold on
    title('Del(P)/P_0 vs Del(u)/u_0 for \gamma=1.4,1.66');
    xlabel('delu/a1');
    ylabel('delp/p1');
    legend
 end