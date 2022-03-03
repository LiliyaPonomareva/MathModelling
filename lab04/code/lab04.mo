model lab04_1
  parameter Real w = 6.6;
  Real x(start=1);
  Real y(start=-1.5);
  
equation
    der(x)= y;
    der(y)= -w*x;

  annotation(experiment(StartTime=0, StopTime=52, Tplerance=1e-06,Interval=0.05));
end lab04_1;
