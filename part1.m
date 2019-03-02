%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           %
%    Erosion and Dilation   %
%                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


im = imread('er.png');
nhood = [0 1 0; 1 1 1; 0 1 0];
% original image
subplot(1,3,1);
imshow(im);
title('Original Image')

de_im = im;
% dilate
for i=1:5
    de_im = imdilate(de_im, nhood);
end
% erode
for i=1:5
    de_im = imerode(de_im, nhood);
end
subplot(1,3,2);
imshow(de_im);
title('Dilated then Eroded')


ed_im = im;
% erode
for i=1:5
    ed_im = imerode(ed_im, nhood);
end% dilate
for i=1:5
    ed_im = imdilate(ed_im, nhood);
end

subplot(1,3,3);
imshow(ed_im);
title('Eroded then Dilated')
