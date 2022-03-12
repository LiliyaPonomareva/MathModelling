model lab05
  parameter Real a = 0.21; // коэффициент естественной смертности хищников
  parameter Real b = 0.035; // коэффициент увеличения числа хищников
  parameter Real c = 0.25; // коэффициент естественного прироста жертв
  parameter Real d = 0.021; // коэффициент смертности жертв
  
  parameter Real x0 = 6;
  parameter Real y0 = 14;
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x + b*x*y;
  der(y) = c*y - d*x*y;
    
  annotation(experiment(StartTime=0, StopTime=100, Tplerance=1e-06,Interval=0.05));
end lab05;
