clear all
clc
g1=1.67;
g4=1.67;
% Mw4=4.2;
% Mw1=28.7;
% T1=300;
% T4=300;
% a1=sqrt(g1*(8314/Mw1)*T1);
% a4=sqrt(g4*(8314/Mw4)*T4);
Ms=linspace(1.1,5,100);
gfn1=2*g1/(g1+1);
gfn4=2*g4/(g4-1);
gfn=(g4-1)/(g1+1);

for a4bya1=[1:1:10]
    a1bya4=1/a4bya1;

    for i=1:length(Ms)
        mfn=(Ms(i)^2-1)/Ms(i);
        numr=1+gfn1*(Ms(i)^2-1);
        denom=(1-gfn*a1bya4*mfn)^gfn4;
        p4byp1(i)=(numr/denom);
    end
    semilogx((p4byp1),Ms,'DisplayName',['a4/a1=' num2str(1/a1bya4)]);
    hold on
end
xlabel('p4/p1');
ylabel('Ms');
title('Ms vs p4/p1 for shock tube');
legend('Location','southeastoutside');