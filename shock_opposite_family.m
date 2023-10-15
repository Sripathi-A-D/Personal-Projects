clear;
clc;

g=1.4;
Ms=2;

%shock 1-2

 p2byp1=1+(2*g/(g+1))*(Ms^2-1);
 a2bya1=sqrt((2*g*Ms^2-(g-1))*(2+(g-1)*Ms^2)/((g+1)^2*Ms^2));
 delubya1_12=linspace(0,2,1000);
 
 pbyp1_12=1+(g.*delubya1_12).*((g+1)*0.25.*delubya1_12+sqrt(1+(g+1)^2*0.25^2.*delubya1_12.^2));
 ubya1_12=delubya1_12;
 u2bya1_12=interp1(pbyp1_12,ubya1_12,p2byp1,'spline');
 plot(ubya1_12,pbyp1_12,'DisplayName','S12 right');
 hold on
 
 %shock 1-5
 Ms2=1.5;
 p5byp1=1+(2*g/(g+1))*(Ms2^2-1);
 a5bya1=sqrt((2*g*Ms^2-(g-1))*(2+(g-1)*Ms^2)/((g+1)^2*Ms^2));
 delubya1_15=linspace(0,2,1000);
 
 pbyp1_15=1+(g.*delubya1_15).*((g+1)*0.25.*delubya1_15+sqrt(1+(g+1)^2*0.25^2.*delubya1_15.^2));
 ubya1_15=-delubya1_15;
 u5bya1_15=interp1(pbyp1_15,ubya1_15,p5byp1,'spline');
 plot(ubya1_15,pbyp1_15,'DisplayName','S15 left');
 hold on
 
 %shock 5-4 
 
 delubya5_54=linspace(0,2,1000);
 
 pbyp5_54=1+(g.*delubya5_54).*((g+1)*0.25.*delubya5_54+sqrt(1+(g+1)^2*0.25^2.*delubya5_54.^2));
 ubya5_54=delubya5_54+(u5bya1_15/a5bya1);
 
 pbyp1_54=pbyp5_54*p5byp1;
 ubya1_54=ubya5_54*a5bya1;
 plot(ubya1_54,pbyp1_54,'DisplayName','S54 right');
 
%  shock 2,3 
 
 delubya2_23=linspace(0,2,1000);
 
 pbyp2_23=1+(g.*delubya2_23).*((g+1)*0.25.*delubya2_23+sqrt(1+(g+1)^2*0.25^2.*delubya2_23.^2));
 ubya2_23=-delubya2_23+(u2bya1_12/a2bya1);
 
 pbyp1_23=pbyp2_23*p2byp1;
 ubya1_23=ubya2_23*a2bya1;
 plot(ubya1_23,pbyp1_23,'DisplayName','S23 left');
 
 legend
 xlabel('u/a1');
     ylabel('p/p1');
     title('Opposite family shocks M=2 interacts M=1.5');