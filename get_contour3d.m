function actr = get_contour3d(ctr1, ctr2, im, m)
  [s_space, pixels] = search_space(ctr1, ctr2, m, im);
  n = size(s_space)(2);
  actr = zeros(n, 2);
  energy = zeros(m, n, m);
  positions = zeros(m,n,m);
  for i=2:n
    for k=1:m
      for j=1:m
	current_pixel = [k, i];
	next_pixel = [j, i+1];
	[ind, sc] = get_min3d(current_pixel, next_pixel, i, k, energy(:, i-1,:), s_space(:, i), m);
	positions(k, i, j) = ind;
	energy(k, i, j) = sc;
       end
     end
  end

  ctr = traceback3d(energy, positions);
  for z=1:n-1
    x = ctr(z, 1);
    y = ctr(z, 2);
    actr(z, :) = pixels(x,y,:);
  end
end