clear;
clc

g=1.4;

p2byp1=[5,7,9,11,13,15,17,19,21,23,25,27,29,30];
for i=1:length(p2byp1)
    Ms(i)=sqrt((p2byp1(i)-1)*((g+1)/(2*g))+1);
    a2bya1=sqrt((2*g*Ms(i)^2-(g-1))*(2+(g-1)*Ms(i)^2)/((g+1)^2*Ms(i)^2));
    syms p3byp2
    term1=(1/g)*(p3byp2*p2byp1(i)-1)/sqrt(1+((g+1)/(2*g))*(p3byp2*p2byp1(i)-1));
    term2=(2/(g-1))*a2bya1*(1-(p3byp2)^((g-1)/(2*g)));
    term3=(1/g)*(p2byp1(i)-1)/sqrt(1+((g+1)/(2*g))*(p2byp1(i)-1));
    eqn=term1+term2-term3==0;
    soln=vpasolve(eqn,p3byp2);
 end

