% Demonstration of Xiao's Image Colour Transfer

% Modified Version with more robust processing.

% Copyright 2015 Han Gong <gong@fedoraproject.org>, University of East
% Anglia.

% With an addition by T E Johnson (April 2020) to ensure consistent 
% processing.

% References:
% Xiao, Xuezhong, and Lizhuang Ma. "Color transfer in correlated color
% space." % In Proceedings of the 2006 ACM international conference on
% Virtual reality continuum and its applications, pp. 305-309. ACM, 2006.

I0 = im2double(imread('2.jpg'));
I1 = im2double(imread('1.jpg'));

% Process without additional ruggedisation processing.
IR1 = cf_Xiao06_ruggedised(I0,I1,false);
% Process with additional ruggedisation processing.
IR2 = cf_Xiao06_ruggedised(I0,I1,true);

figure; 
subplot(1,4,1); imshow(I0); title('Original Image'); axis off
subplot(1,4,2); imshow(I1); title('Target Palette'); axis off
subplot(1,4,3); imshow(IR1); title('Result from Standard Processing'); 
axis off
subplot(1,4,4); imshow(IR2); title('Result from Ruggedised Processing'); 
axis off
set(gcf, 'Position', get(0, 'Screensize'));
