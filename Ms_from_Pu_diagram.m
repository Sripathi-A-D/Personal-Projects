clear;
clc;

%Given
p4_p1=100;
a4_a1=1;
g1=5/3;
g4=5/3;
a1_a4=1./a4_a1;
%shock Mach number 

%plot of p4byp1 vs Ms
for k=1:length(a4_a1)
    figure
    Ms_trial=linspace(1,6,1000);
    gfn1=2*g1/(g1+1);
    gfn4=2*g4/(g4-1);
    gfn=(g4-1)/(g1+1);
     for i=1:length(Ms_trial)
            mfn=(Ms_trial(i)^2-1)/Ms_trial(i);
            numr=1+gfn1*(Ms_trial(i)^2-1);
            denom=(1-gfn*a1_a4(k)*mfn)^gfn4;
            p4_p1_trial(i)=(numr/denom);
     end
     Ms=interp1(p4_p1_trial,Ms_trial,p4_p1,'spline');
     p2_p1=1+(2*g1/(g1+1))*(Ms^2-1);
     %expansion 4-3

     p_p4_43=linspace(0,1,1000);
     delu_a4_43=(2/(g4-1))*(1-p_p4_43.^((g4-1)/(2*g4)));
     u_a4_43=delu_a4_43-0;
     u_a1_43=u_a4_43*a4_a1(k);
     p_p1_43=p_p4_43*p4_p1;

     u3_a1_43=interp1(p_p1_43,u_a1_43,p2_p1,'spline'); %p2=p3;
     plot(u_a1_43,p_p1_43,'DisplayName','r43 left');
     a3_a4=1-(g4-1)*0.5*(u3_a1_43/a4_a1(k));
     hold on
      %shock 1-2


     a2bya1=sqrt((2*g1*Ms^2-(g1-1))*(2+(g1-1)*Ms^2)/((g1+1)^2*Ms^2));
     delubya1_12=linspace(0,u3_a1_43,1000);

     pbyp1_12=1+(g1.*delubya1_12).*((g1+1)*0.25.*delubya1_12+sqrt(1+(g1+1)^2*0.25^2.*delubya1_12.^2));
     ubya1_12=delubya1_12;
     u2bya1_12=interp1(pbyp1_12,ubya1_12,p2_p1,'spline');
     plot(ubya1_12,pbyp1_12,'DisplayName','s12 right');
     hold on
     xline(u2bya1_12,'DisplayName','Ms=2.186' );
     title(['Ms for p4/p1=100 a4/a1=' num2str(a4_a1(k))]);
     legend
     xlabel('u/a1');
ylabel('p/p1');
end

