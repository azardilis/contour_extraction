function [im, ctr1, ctr2] = init()
  im = preprocess_im('tongue.png');
  ctr1 = load('init1.ctr');
  ctr2 = load('init2.ctr');
end