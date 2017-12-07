% Hideaki Yoshida

clf
colormap('gray');

im1 = imread('planes1.jpg');
subplot(4,1,1);
imagesc(im1);
axis off;
title('Plane 1','fontweight','bold');

im2 = imread('planes2.jpg');
subplot(4,1,2);
imagesc(im2);
axis off;
title('Plane 2','fontweight','bold');

diff = im1 - im2;
subplot(4,1,3);
imagesc(diff);
axis off;
title('Difference','fontweight','bold');

% Find row and col indecies of max values.
[r,c] = ind2sub(size(diff),find(diff == max(diff(:))));
hold on;
plot(c,r,'.r');
text(c+2,r+2,'max', 'color', 'red');

threshold = .15 * max(diff(:));
% Create a logical array of elements bigger than the threshold.
newdiff = diff >= threshold;
subplot(4,1,4);
imagesc(newdiff);
axis off;
title('Difference > thresholdValue','fontweight','bold');
