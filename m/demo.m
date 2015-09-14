% Demostration of Xiao's Image Colour Transfer

% Copyright 2015 Han Gong <gong@fedoraproject.org>, University of East
% Anglia.

% References:
% Xiao, Xuezhong, and Lizhuang Ma. "Color transfer in correlated color
% space." % In Proceedings of the 2006 ACM international conference on
% Virtual reality continuum and its applications, pp. 305-309. ACM, 2006.

I0 = im2double(imread('4.jpg'));
I1 = im2double(imread('3.jpg'));

IR = cf_Xiao06(I0,I1);

figure; 
subplot(1,3,1); imshow(I0); title('Original Image'); axis off
subplot(1,3,2); imshow(I1); title('Target Palette'); axis off
subplot(1,3,3); imshow(IR); title('Result After Colour Transfer'); axis off
