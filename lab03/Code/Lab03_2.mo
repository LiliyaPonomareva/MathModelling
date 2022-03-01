model Lab03_2
  parameter Real x0 = 38000;
  parameter Real y0 = 29000;
  
  parameter Real a = 0.37;
  parameter Real b = 0.76;
  parameter Real c = 0.32;
  parameter Real h = 0.61;
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x - b*y + abs(sin(6*time));
  der(y) = -c*x - h*y + abs(cos(7*time));
  
end Lab03_2;
