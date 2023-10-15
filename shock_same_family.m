clear;
clc;

g=1.4;
Ms1=2;
Ms2=1.3;


%shock12
    
    p2byp1=1+(2*g/(g+1))*(Ms1^2-1);
    pbyp1_12=linspace(1,p2byp1,1000);
    delubya1_12=sqrt(1./(g*(g-2*((g+1)/4)+2*((g+1)/4).*pbyp1_12))).*(pbyp1_12-1);
    ubya1_12=delubya1_12+0;
    plot(ubya1_12,pbyp1_12,'DisplayName','S12-right','Linewidth',2);
    hold on
    u2bya1=interp1(pbyp1_12,ubya1_12,p2byp1,'spline');
    a2bya1=sqrt((2*g*Ms1^2-(g-1))*(2+(g-1)*Ms1^2)/((g+1)^2*Ms1^2));
    
%shock 23
    
    p3byp2=1+(2*g/(g+1))*(Ms2^2-1);
    p3byp1=p3byp2*p2byp1;
    
    
    pbyp1_23=linspace(p2byp1,p3byp1,1000);
    pbyp2_23=pbyp1_23/p2byp1;
    
    
    delubya2_23=sqrt(1./(g*(g-2*((g+1)/4)+2*((g+1)/4).*pbyp2_23))).*(pbyp2_23-1);
    
   
    ubya1_23=u2bya1+delubya2_23*a2bya1;
    
    u3bya1_23=interp1(pbyp1_23,ubya1_23,p3byp1,'spline');
    u3bya2_23=u3bya1_23/a2bya1;
    a3bya2=1-(g-1)*0.5*(u3bya2_23);
    
    
    plot(ubya1_23,pbyp1_23,'DisplayName','S23-right','Linewidth',2);
  
    
%unsteady expansion 3-4
   
    pbyp1_34=linspace(p3byp1,2,1000);
    pbyp3_34=pbyp1_34/p3byp1;
    
    delubya3_34=(1-pbyp3_34.^((g-1)/(2*g)))*(2/(g-1));
    
    ubya1_34=u3bya1_23+delubya3_34*a3bya2*a2bya1;
    
    plot(ubya1_34,pbyp1_34,'DisplayName','R43-left','Linewidth',1);
    
%shock15
    
    pbyp1_15=linspace(1,10,1000);
    
    
    delubya1_15=sqrt(1./(g*(g-2*((g+1)/4)+2*((g+1)/4).*pbyp1_15))).*(pbyp1_15-1);
    ubya1_15=delubya1_15+0;
    plot(ubya1_15,pbyp1_15,'DisplayName','S15-right','Linewidth',1);
    legend();
    hold on

xlabel('u/a1');
     ylabel('p/p1');
     title('M=2 overtaken by same family shock M=1.3');
    


    
    
    
    