clear all
% img=imread('input_hcd1.jpg'); % Read an image 
img=imread('input_hcd2.jpg'); % Read an image 
img=im2double(img); 

sobel_kernel_x=[1,0,-1;
                2,0,-2;
                1,0,-1]; %sobel edge operatort for blurring
          
sobel_kernel_y=[1, 2, 1;
                0, 0, 0;
               -1,-2,-1]; %sobel edge operatort for blurring
           
% Image gradients
img_x=convolve(img, sobel_kernel_x); % custom convolution function for kernel 3x3
img_y=convolve(img, sobel_kernel_y); % custom convolution function for kernel 3x3

% Pixel by Pixel products of the images
Ixx=img_x.*img_x;
Iyy=img_y.*img_y;
Ixy=img_x.*img_y;

window = [1,1,1;
          1,1,1;
          1,1,1]; % smoothing window
		  
img_size=size(img);% This gives the dimensions of the image in [length,width]
length=img_size(1); %extract the length value from the img_size vector
width=img_size(2); %extract the width value from the img_size
R_img = zeros(length,width, 'double');% create a blank matrix for the new img
R_img_no_thresholding = zeros(length,width, 'double');% create a blank matrix for the new img

% Smoothed Images 
Sxx = convolve(Ixx,window);
Syy = convolve(Iyy,window);
Sxy = convolve(Ixy,window);

% Determining R and Thresholding
threshold_value = 15; % 80 for img1 and 15 img2

for i=1:length
        for j=1:width
          Hxy=[ Sxx(i,j) , Sxy(i,j);
                Sxy(i,j),  Syy(i,j)];
          k=0.06;   
          R= det(Hxy)- k*trace(Hxy)^2; 
          R_img_no_thresholding(i,j) = R;
         if(R > threshold_value) R_img(i,j)= R; 
         end
         
        end 
end 

figure(1)
imshow(img) 
title('Original Image')
figure(2)
imshow(R_img_no_thresholding) 
title('Harris Corner Detection Without Thresholding')
figure(3)
imshow(R_img) 
title('Harris Corner Detection With Thresholding')

currentFolder = pwd;
File   = 'hcd_output.jpg';
imwrite(R_img, fullfile(currentFolder, File));