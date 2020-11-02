clear all;

% read image
I = imread('harris.jpg');
I = rgb2gray(I);
I = im2double(I);

% initialize sobel filter masks
sobelX = [1 0 -1; 2 0 -2; 1 0 -1];
sobelY = [1 2 1; 0 0 0; -1 -2 -1];

% compute gradients
Ix = conv2(I, sobelX, 'same');
Iy = conv2(I, sobelY, 'same');

Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;

% gaussian filter
Ix2 = imgaussfilt(Ix2);
Iy2 = imgaussfilt(Iy2);
Ixy = imgaussfilt(Ixy);

% build M
Ix2p = padarray(Ix2, [1, 1]);   % apply one layer of padding around the matrix
Iy2p = padarray(Iy2, [1, 1]);
Ixyp = padarray(Ixy, [1, 1]);

[height, width] = size(I);      % Create an identical matrix as the input image
eigen = zeros(height, width);      %

for i = 2 : height - 1
    for j = 2 : width - 1
        M = zeros(2, 2);
        for w1 = -1:1
            for w2 = -1:1
                M = M + [Ix2p(i+w1, j+w2) Ixyp(i+w1, j+w2);
                        Ixyp(i+w1, j+w2) Iy2p(i+w1, j+w2)];
            end
        end
        eigen(i-1, j-1) = 0.5 * ((M(1,1) + M(2,2)) - sqrt(4*M(1,2)*M(2,1) + (M(1,1) - M(2,2)).^2));
    end
end

% calculate eigenvalue
   
% threshold
threshold = 0.5;

% display
imshow(eigen > threshold);
