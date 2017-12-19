function dydt = odefcn(t,x,p)
dydt=zeros(5,1);
dydt(1) = -(p(1) + p(2)) * x(1);
dydt(2) = p(1) * x(1);
dydt(3) = p(2) * x(1) -((p(3) + p(4)) * x(3)) + p(5) * x(5);
dydt(4) = p(3) * x(3);
dydt(5) = p(4) * x(3) - (p(5) * x(5));
end