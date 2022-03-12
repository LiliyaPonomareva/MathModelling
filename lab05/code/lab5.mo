model lab5
  parameter Real a = 0.21; // коэффициент естественной смертности хищников
  parameter Real b = 0.035; // коэффициент увеличения числа хищников
  parameter Real c = 0.25; // коэффициент естественного прироста жертв
  parameter Real d = 0.021; // коэффициент смертности жертв
  
  parameter Real x0 = 6; // изначальная численность хищников
  parameter Real y0 = 14; // изначальная численность жертв
  
  //parameter Real x0 = c/d; // стационарное значение для хищников
  //parameter Real y0 = a/b; // стационарное значение для жертв
  
  Real x(start=x0);
  Real y(start=y0);
  
equation
  der(x) = -a*x + b*x*y;
  der(y) = c*y - d*x*y;
    
  annotation(experiment(StartTime=0, StopTime=100, Tplerance=1e-06,Interval=0.05));
end lab5;
