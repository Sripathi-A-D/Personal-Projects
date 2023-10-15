clear;
g1=1.4;
g5=1.67;
T5byT1=1;
Mw5=4.002602;
Mw1=28.9647;

a5bya1=sqrt(g5*(8314/Mw5)*T5byT1/(g1*(8314/Mw1)));
rho5byrho1=(Mw5/Mw1)/T5byT1;


%shock 1-2
 Ms=2;
 p2byp1=1+(2*g1/(g1+1))*(Ms^2-1);
 a2bya1=sqrt((2*g1*Ms^2-(g1-1))*(2+(g1-1)*Ms^2)/((g1+1)^2*Ms^2));
 delubya1_12=linspace(0,2,1000);
 
 pbyp1_12=1+(g1.*delubya1_12).*((g1+1)*0.25.*delubya1_12+sqrt(1+(g1+1)^2*0.25^2.*delubya1_12.^2));
 ubya1_12=delubya1_12;
 u2bya1_12=interp1(pbyp1_12,ubya1_12,p2byp1,'spline');
 semilogy(ubya1_12,pbyp1_12,'DisplayName','s12 right');
 hold on
 
 %shock 5-4 Transmitted p1=p5 no conversion needed
 
 delubya5_54=linspace(0,2,1000);
 
 pbyp5_54=1+(g5.*delubya1_12).*((g5+1)*0.25.*delubya1_12+sqrt(1+(g5+1)^2*0.25^2.*delubya1_12.^2));
 ubya5_54=delubya5_54;
 ubya1_54=ubya5_54*a5bya1;
 semilogy(ubya1_54,pbyp5_54,'DisplayName','s54 right');
 hold on
if rho5byrho1<(1/a5bya1) 
     %Expansion 2-3

     pbyp2_23=linspace(0.1,1,1000);
     delubya2_23=(2/(g1-1))*(1-pbyp2_23.^((g1-1)/(2*g1)));
     ubya2_23=delubya2_23+(u2bya1_12/a2bya1);
     ubya1_23=ubya2_23*a2bya1;
     pbyp1_23=pbyp2_23*p2byp1;


     semilogy(ubya1_23,pbyp1_23,'DisplayName','r23 left');

     hold on
     legend
else
     %shock 2-3
     
     delubya2_23=linspace(0,5,1000);
     
     pbyp2_23=1+(g1.*delubya2_23).*((g1+1)*0.25.*delubya2_23+sqrt(1+(g1+1)^2*0.25^2.*delubya2_23.^2));
     ubya2_23=-delubya2_23+(u2bya1_12/a2bya1);
     
     pbyp1_23=pbyp2_23*p2byp1;
     ubya1_23=ubya2_23*a2bya1;
     
     semilogy(ubya1_23,pbyp1_23,'DisplayName','s23 left');
     
     hold on
     legend
end
xlabel('u/a1');
     ylabel('p/p1');
     title('Shock interaction with density interface Ms=2');