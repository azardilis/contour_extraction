function im = preprocess_im(filename)
  im = imread(filename);
  im = double(im);
  imax = max(max(im));
  imin = min(min(im));
  im = (im - imin) / (imax - imin);
  im = -im;