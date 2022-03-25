model lab07_1
  parameter Real N=3010;
  Real n(start=23);

equation
    der(n)=(0.566 + 0.000066*n)*(N - n); 
end lab07_1;
