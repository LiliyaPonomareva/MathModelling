model lab07_3
  parameter Real N=3010;
  Real n(start=23);

equation
  der(n)=(0.34*cos(time)*n)*(N - n); 
end lab07_3;
