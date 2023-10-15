clear;
g=1.4;
%expansion 12 right

pbyp1_12=linspace(0.5,1,1000);
 delubya1_12=(2/(g-1))*(1-pbyp1_12.^((g-1)/(2*g)));
 ubya1_12=-delubya1_12;
 u2bya1_12=0.09; %given
 p2byp1=(1-(g-1)*0.5*u2bya1_12)^(2*g/(g-1));
 a2bya1=p2byp1^((g-1)/(2*g));
 
 semilogy(ubya1_12,pbyp1_12,'DisplayName','r12 right');
 
 hold on
 
 %expansion 15 left

pbyp1_15=linspace(0.5,1,1000);
 delubya1_15=(2/(g-1))*(1-pbyp1_15.^((g-1)/(2*g)));
 ubya1_15=delubya1_15;
 u5bya1_15=0.08; %given
 p5byp1=(1-(g-1)*0.5*u5bya1_15)^(2*g/(g-1));
 a5bya1=p5byp1^((g-1)/(2*g));
 semilogy(ubya1_15,pbyp1_15,'DisplayName','r15 left');
 
 hold on
 %expansion 54 right

pbyp5_54=linspace(0.5,1,1000);
delubya5_54=(2/(g-1))*(1-pbyp5_54.^((g-1)/(2*g)));
 ubya5_54=-delubya5_54+(u5bya1_15/a5bya1);
 ubya1_54=ubya5_54*a5bya1;
 pbyp1_54=pbyp5_54*p5byp1;
 semilogy(ubya1_54,pbyp1_54,'DisplayName','r54 right');
 
 hold on
 %expanasion 23 left
 pbyp2_23=linspace(0.5,1,1000);
 delubya2_23=(2/(g-1))*(1-pbyp2_23.^((g-1)/(2*g)));
 ubya2_23=delubya2_23+(-u2bya1_12/a2bya1);
 ubya1_23=ubya2_23*a2bya1;
 pbyp1_23=pbyp2_23*p2byp1;
 semilogy(ubya1_23,pbyp1_23,'DisplayName','r23 right');
 
 hold on
 
 legend
 
 xlabel('u/a1');
     ylabel('p/p1');
     title('Opposite family, expansion fan interaction');