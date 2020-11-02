clc;
clear;
close all;

imgin = im2double(imread('./target.jpg'));

[imh, imw, nb] = size(imgin);
assert(nb==1);
% the image is grayscale

V = zeros(imh, imw);
V(1:imh*imw) = 1:imh*imw;
% V(y,x) = (y-1)*imw + x
% use V(y,x) to represent the variable index of pixel (x,y)
% Always keep in mind that in matlab indexing starts with 1, not 0

%TODO: initialize counter, A (sparse matrix) and b.
e = 1;
A = sparse([], [], [], (imh - 1) * (imw - 1) * 2 + 1, imh * imw, (imh - 1) * (imw - 1) * 4 + 1);
b = zeros((imh - 1) * (imw - 1) * 2 + 1);


%TODO: fill the elements in A and b, for each pixel in the image
for y = 1 : imh - 1
    for x = 1 : imw - 1
        A(e, 
        A(e,
        b(e,
        
        e = e + 1;
        
        A(e, 
        A(e, 
        b(e,
    end
end

%TODO: add extra constraints
%-----
%-----


%TODO: solve the equation
%use "lscov" or "\", please google the matlab documents
% solution = ???
error = sum(abs(A*solution-b));
disp(error)
imgout = reshape(solution,[imh,imw]);

imwrite(imgout,'output.png');
figure(), hold off, imshow(imgout);

