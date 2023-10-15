clear;
%Given

p4byp1=10;
a4bya1=2;
g1=7/5; % air
g4=5/3; % helium
a1bya4=1/a4bya1;
%shock Mach number 

%plot of p4byp1 vs Ms

Ms_trial=linspace(1,6,1000);
gfn1=2*g1/(g1+1);
gfn4=2*g4/(g4-1);
gfn=(g4-1)/(g1+1);
 for i=1:length(Ms_trial)
        mfn=(Ms_trial(i)^2-1)/Ms_trial(i);
        numr=1+gfn1*(Ms_trial(i)^2-1);
        denom=(1-gfn*a1bya4*mfn)^gfn4;
        p4byp1_trial(i)=(numr/denom);
 end
 Ms=interp1(p4byp1_trial,Ms_trial,p4byp1,'spline');
 p2byp1=1+(2*g1/(g1+1))*(Ms^2-1);
 %expansion 4-3
 
 pbyp4_43=linspace(0,1,1000);
 delubya4_43=(2/(g4-1))*(1-pbyp4_43.^((g4-1)/(2*g4)));
 ubya4_43=delubya4_43-0;
 ubya1_43=ubya4_43*a4bya1;
 pbyp1_43=pbyp4_43*p4byp1;
 
 u3bya1_43=interp1(pbyp1_43,ubya1_43,p2byp1,'spline'); %p2=p3;
 plot(ubya1_43,pbyp1_43,'DisplayName','R43 left');
 a3bya4=1-(g4-1)*0.5*(u3bya1_43/a4bya1);
 hold on
  %shock 1-2
 

 a2bya1=sqrt((2*g1*Ms^2-(g1-1))*(2+(g1-1)*Ms^2)/((g1+1)^2*Ms^2));
 delubya1_12=linspace(0,u3bya1_43,1000);
 
 pbyp1_12=1+(g1.*delubya1_12).*((g1+1)*0.25.*delubya1_12+sqrt(1+(g1+1)^2*0.25^2.*delubya1_12.^2));
 ubya1_12=delubya1_12;
 u2bya1_12=interp1(pbyp1_12,ubya1_12,p2byp1,'spline');
 plot(ubya1_12,pbyp1_12,'DisplayName','S12 right');
 hold on
 
 %reflected shock 2-5
 Mr=(1/a2bya1)*0.5*((Ms^2-1)/Ms)+sqrt((1/a2bya1)^2*((Ms^2-1)/(4*Ms))^2+1);
 
 delubya2_25=linspace(0,u2bya1_12/a2bya1,1000);
 pbyp2_25=1+(g1.*delubya2_25).*((g1+1)*0.25.*delubya2_25+sqrt(1+(g1+1)^2*0.25^2.*delubya2_25.^2));
 ubya2_25=-delubya2_25+(u2bya1_12/a2bya1);
 ubya1_25=ubya2_25*a2bya1;
 pbyp1_25=pbyp2_25*p2byp1;
 plot(ubya1_25,pbyp1_25,'DisplayName','S25 left');
 a5bya2=sqrt((2*g1*Mr^2-(g1-1))*(2+(g1-1)*Mr^2)/((g1+1)^2*Mr^2));
 p5byp1=interp1(ubya1_25,pbyp1_25,0,'spline');
 
% transmitted shock 3-6

delubya3_36=linspace(1,u2bya1_12/(a4bya1*a3bya4),1000);
pbyp3_36=1+(g4.*delubya3_36).*((g4+1)*0.25.*delubya3_36+sqrt(1+(g4+1)^2*0.25^2.*delubya3_36.^2));
ubya3_36=-delubya3_36+(u2bya1_12/(a4bya1*a3bya4));
ubya1_36=ubya3_36*a3bya4*a4bya1;
pbyp1_36=pbyp3_36*p2byp1; %p2=p3
p0byp1_36=interp1(ubya1_36,pbyp1_36,0,'spline');
plot(ubya1_36,pbyp1_36,'DisplayName','S36 left');

if p5byp1<p0byp1_36
    %relflected shock 5-7

     delubya5_57=linspace(0,1,1000);
     pbyp5_57=1+(g1.*delubya5_57).*((g1+1)*0.25.*delubya5_57+sqrt(1+(g1+1)^2*0.25^2.*delubya5_57.^2));
     ubya5_57=delubya5_57-0;
     ubya1_57=ubya5_57*a5bya2*a2bya1;
     pbyp1_57=pbyp5_57*p5byp1;
     plot(ubya1_57,pbyp1_57,'DisplayName','S57 right');
     title(['P4/P1=10000 '  ' overtailored']);
else
    %expansion 5-7
 
 pbyp5_57=linspace(0,1,1000);
 delubya5_57=(2/(g1-1))*(1-pbyp5_57.^((g1-1)/(2*g1)));
 ubya5_57=-delubya5_57-0;
 ubya1_57=ubya5_57*a5bya2*a2bya1;
 pbyp1_57=pbyp5_57*p5byp1;
 
 
 plot(ubya1_57,pbyp1_57,'DisplayName','R57 right');
 a3bya4=1-(g4-1)*0.5*(u3bya1_43/a4bya1);
 hold on
 title(['P4/P1=10 ' ' Undertailored case']);
end
xline(0,'--')
 legend();
    
    xlabel('u/a1');
    ylabel('p/p1');
 
 
        
 
 
 