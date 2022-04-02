model lab08
  parameter Real a1 = p_cr/(t1^2 * p1^2*N*q);
  parameter Real a2 = p_cr/(t2^2 * p2^2 * N*q);
  parameter Real b = p_cr/(t1^2*p1^2 * t2^2*p2^2 * N*q);
  parameter Real c1 = (p_cr - p1)/(t1 * p1);
  parameter Real c2 = (p_cr - p2)/(t2 * p2);
  
  parameter Real p_cr = 35;
  parameter Real N = 44;
  parameter Real q = 1;
  parameter Real t1 = 21;
  parameter Real t2 = 20;
  parameter Real p1 = 13;
  parameter Real p2 = 10;
  
  Real M1(start = 9.1);
  Real M2(start = 7.7);
  
  equation
    der(M1) = M1 - b/c1 * M1 * M2 - a1/c1 * M1^2;
    der(M2) = c2/c1 * M2 - b/c1 * M1 * M2 - a2/c1 * M2^2;
    
end lab08;
