clear;
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
 
 %left expansion 1-5
 
 pbyp1_15=linspace(0,1,1000);
 delubya1_15=(2/(g-1))*(1-pbyp1_15.^((g-1)/(2*g)));
 ubya1_15=delubya1_15;
 u5bya1_15=0.93; %given
 a5bya1=1-(g-1)*0.5*u5bya1_15;
 p5byp1=a5bya1^(2*g/(g-1));
 plot(ubya1_15,pbyp1_15,'DisplayName','R15 left');
 
 hold on
 legend
     
  %shock 54
  
 
 delubya5_54=linspace(0,2,1000);
 
 pbyp5_54=1+(g.*delubya5_54).*((g+1)*0.25.*delubya5_54+sqrt(1+(g+1)^2*0.25^2.*delubya5_54.^2));
 ubya5_54=delubya5_54+(u5bya1_15/a5bya1);
 ubya1_54=ubya5_54*a5bya1;
 pbyp1_54=pbyp5_54*p5byp1;
 
 plot(ubya1_54,pbyp1_54,'DisplayName','S54 right');
 hold on
 
  %left expansion 23
 
 pbyp2_23=linspace(0,1,1000);
 delubya2_23=(2/(g-1))*(1-pbyp2_23.^((g-1)/(2*g)));
 ubya2_23=delubya1_15+(u2bya1_12/a2bya1);
 ubya1_23=ubya2_23*a2bya1;
 pbyp1_23=pbyp2_23*p2byp1;
 
 
 
 plot(ubya1_23,pbyp1_23,'DisplayName','R23 left');
 legend
 
 hold on
 legend
xlabel('u/a1');
     ylabel('p/p1');
     title(' Ms=2(right) interacts with expansion u/c1=0.93(left)');