% load image
im = imread('coins.jpg');
im = imread('planets.jpg');
im = imread('choice1.jpg');

% get circle centers
r = 40;
circles_ht = detectCirclesHT(im, r);
circles_ransac = detectCirclesRANSAC(im, r);

% plot the circls on images
subplot(2,1,1)
imshow(im);
hold on;
sz = size(circles_ht(:,1));
viscircles(circles_ht, ones(sz).*r, 'Color', 'b');
hold off;

subplot(2,1,2)
imshow(im);
hold on;
sz = size(circles_ransac(:,1));
viscircles(circles_ransac, ones(sz).*r, 'Color', 'r');
hold off;
