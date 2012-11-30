function ctr = traceback3d(energy, positions)
  #find the minimum energy in second to last column
  n = size(positions)(2);
  m = size(positions)(1);
  min_index = [0,0];
  min = 500000;
  ctr = zeros(n, 2);
  for i=1:m
    for j=1:m
      ce = energy(i, n-1, j);
      if ce < min
	min = ce;
	min_index = [i, j];
      end
    end
  end

  ctr(1, :) = [min_index(2), n];
  ctr(2, :) = [min_index(1), n-1];

  s = n-2;
  next = min_index(1);
  ind = positions(min_index(1), n-1, min_index(2));#min_index(1);
  for i=2:n-1
    ctr(i, :) = [ind, s];
    tind = ind;
    ind = positions(ind, s, next);
    next = tind;
    s = s - 1;
  end
end