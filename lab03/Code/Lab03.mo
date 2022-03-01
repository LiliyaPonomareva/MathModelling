model Lab03
  parameter Real x0 = 38000;
  parameter Real y0 = 29000;
  
  parameter Real a = 0.41;
  parameter Real b = 0.76;
  parameter Real c = 0.59;
  parameter Real h = 0.63;
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x - b*y + abs(sin(time + 3));
  der(y) = -c*x - h*y + abs(cos(time + 2));
  
end Lab03;
