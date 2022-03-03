model lab04_3
  parameter Real w = 6;
  parameter Real g = 2.4;
  Real x(start=1);
  Real y(start=-1.5);
  
  equation
    der(x)= y;
    der(y)= 0.2*cos(3*time)-g*y-w*x;

  annotation(experiment(StartTime=0, StopTime=52, Tplerance=1e-06,Interval=0.05));

end lab04_3;
