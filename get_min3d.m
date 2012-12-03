function [ind, score] = get_min3d(current_pixel, next_pixel,scores, int, m)
  lambda = 0.5;
  row = current_pixel(1);
  col = current_pixel(2);
  loc1 = [(1:m)', ones(m, 1)*(col-1)];
  loc2 = [ones(m, 1)*current_pixel(1), ones(m, 1)*current_pixel(2)];
  loc3 = [ones(m, 1)*next_pixel(1), ones(m, 1)*next_pixel(2)];
  engs = lambda * magnitude((loc3 - 2*loc2 + loc1)') ./ magnitude((loc3 - loc1)') + (1 - lambda) * int;
  scs = scores + engs';
  [score, ind] = min(scs);
end