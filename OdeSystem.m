function [ xp ] = OdeSystem( t,x,Parameters )
xp=zeros(5,1);
xp(1) = -(Parameters(1) + Parameters(2)) * x(1);
xp(2) = Parameters(1) * x(1);
xp(3) = Parameters(2) * x(1) -((Parameters(3) + Parameters(4)) * x(3)) + Parameters(5) * x(5);
xp(4) = Parameters(3) * x(3);
xp(5) = Parameters(4) * x(3) - (Parameters(5) * x(5));
end
