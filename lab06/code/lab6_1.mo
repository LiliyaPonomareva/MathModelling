model lab6
  parameter Real N = 5555;
  parameter Real I0 = 75;
  parameter Real R0 = 4;
  parameter Real S0 = N-I0-R0;
  parameter Real a = 0.01;
  parameter Real b = 0.02;
  
  Real I(start = I0);
  Real R(start = R0);
  Real S(start = S0);
equation
  // 1 случай
  // der(S) = 0;
  // der(I) = -b*I;
  // der(R) = b*I;
  
  // 2 случай
  der(S) = -a*S;
  der(I) = a*S - b*I;
  der(R) = b*I;

end lab6;
