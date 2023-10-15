clear;
g1=1.4;
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
 
%expansion 23 right

 pbyp2_23=linspace(0.7,1,1000);
 delubya2_23=(2/(g1-1))*(1-pbyp2_23.^((g1-1)/(2*g1)));
 ubya2_23=-delubya2_23+(u2bya1_12/a2bya1);
 u3bya2_23=-0.05+(u2bya1_12/a2bya1); %given
 p3byp2=(1-(g1-1)*0.5*(u3bya2_23-(u2bya1_12/a2bya1)))^(2*g1/(g1-1));
 a3bya2=p3byp2^((g1-1)/(2*g1));
 
 ubya1_23=ubya2_23*a2bya1;
 pbyp1_23=pbyp2_23*p2byp1;
 semilogy(ubya1_23,pbyp1_23,'DisplayName','r12 right');
 xlim([0.8 1.3]);
 hold on
 
 %shock 34 left
 delubya3_34=linspace(0,0.2,1000);
 
 pbyp3_34=1+(g1.*delubya3_34).*((g1+1)*0.25.*delubya3_34+sqrt(1+(g1+1)^2*0.25^2.*delubya3_34.^2));
 ubya3_34=-delubya3_34+(u3bya2_23/a3bya2);
 ubya1_34=ubya3_34*a3bya2*a2bya1;
 pbyp1_34=pbyp3_34*p3byp2*p2byp1;
 semilogy(ubya1_34,pbyp1_34,'DisplayName','s12 right');
 hold on