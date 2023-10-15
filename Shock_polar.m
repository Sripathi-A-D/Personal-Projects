g=1.4;
j=0;
for M1=[2:1:10];
    up=1+(2*g/(g+1))*(M1^2-1);
    p2byp1=linspace(1,up,1000);
    rng('shuffle');
    j=j+1;
    i = rand(10,1);
    q= linspace(rand(1,1),rand(1,1),10);
    r= linspace(rand(1,1),rand(1,1),10);
    gfn=(g+1) / (2*g);
    gfn2=(3*g+1)/(2*g);
    term=(1/M1^2)*(gfn.*(p2byp1-1)+1);
    cotbeta=sqrt((1./term)-1);
    term2=gfn.*(p2byp1-1)./((g+1).*0.5*M1^2-(gfn.*(p2byp1-1)));
    theta=atan(cotbeta.*term2);
    plot(theta,p2byp1,-theta,p2byp1,'--','color',[i(j) q(j) r(j)],'DisplayName',['M=',num2str(M1)],'Linewidth',1.5);
    hold on
    
    xlabel('\theta');
    ylabel('p2/p1');
    title('Shock polar');
    %ylim([1,4]);
    legend('Location','eastoutside');
end
