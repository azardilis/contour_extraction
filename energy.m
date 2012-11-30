function eng = energy(loc1, loc2, loc3, im)
  lambda = 0.5;
  str = lambda * ((magnitude(loc3 - 2*loc2 + loc1)^2) / (magnitude(loc3 - loc1)^2));
  int = (1 - lambda) * im(loc2(1));
  eng = str + int;
end