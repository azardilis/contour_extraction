function [ind, score] = get_min3d(current_pixel, next_pixel, col, row, scores, im, m)
  score = 50000;
  ind = 0;

  for i=1:m
    loc1 = [i, col-1]; #previous pixel
    eng = energy(loc1, current_pixel, next_pixel, im);
    sc = scores(i, row) + eng;
    if sc < score
      score = sc;
      ind = i;
    end
  end
end