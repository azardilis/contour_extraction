function [s_space, pixels] = search_space(ctr1, ctr2, m, im)
  n = length(ctr1);
  s_space = zeros(m,n);
  pixels = zeros(m,n,2);
  for i=1:n
    p1 = ctr1(i, :);
    p2 = ctr2(i, :);
    [y,x] = fillline(p1, p2, m);
    for k=1:m
      pixels(k, i, :) = [round(y(k)), round(x(k))];
      s_space(k, i) = im(round(x(k)), round(y(k)));
    end
   end