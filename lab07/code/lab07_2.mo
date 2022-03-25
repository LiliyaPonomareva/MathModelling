model lab07_2
  parameter Real N=3010;
  Real n(start=23);

equation
  der(n)=(0.000044 + 0.244*n)*(N - n); 
end lab07_2;
