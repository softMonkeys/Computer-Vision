clear all;

%parameters
sigma     = 2;
threshold = 0.2;
rhoRes    = 1;
thetaRes  = pi/360;

% Load image
I = imread('sfu.jpg');

% Convert to grayscale and scale to [0,1]
if (ndims(I) == 3)
    I = rgb2gray(I);
end

I = double(I) / 255;

% Gaussian filter
I = imgaussfilt(I, sigma);

% Edge filter - use edge()
Iedge = edge(I);
imshow(Iedge);

% Hough transform
[H] = houghTransform(I, threshold, rhoRes, thetaRes);

% Show normalized H
imshow(H/max(H(:))*255)
