clear all
img=imread('image2.jpg'); % Read an image 
img=im2double(img); 
% Matlab realsqrt operator requires double values 
% im2double changes 0-255 to corresponding double values
sobel_kernel_x=[1,0,-1;
              2,0,-2;
              1,0,-1]; %sobel edge operatort
          
sobel_kernel_y=[1, 2, 1;
                0, 0, 0;
               -1,-2,-1]; %sobel edge operatort
          
img_size=size(img);% This gives the dimensions of the image in [length,width]
length=img_size(1); %extract the length value from the img_size vector
width=img_size(2); %extract the width value from the img_size

x_comp = convolve(img, sobel_kernel_x); % custom convolution function for kernel 3x3
y_comp = convolve(img, sobel_kernel_y); % custom convolution function for kernel 3x3
img_sobel_edges = realsqrt(x_comp.^2 + y_comp.^2); % sobel edge detection
img_sobel_edges_no_thresholding = img_sobel_edges ;

% Thresholding (YOU CAN CHANGE THE THRESHOLDING VALUE HERE)
Thresholding=0.5;
for i=1:length 
        for j=1:width
            if (img_sobel_edges(i,j)<Thresholding) img_sobel_edges(i,j) = Thresholding;
            end
        end 
end 
%% Displaying Images
figure(1)
	imshow(img) 
	title('Original Image')
figure(2)
	subplot(2,2,[1,2])
	imshow(x_comp) 
	title('X - Component')
	subplot(2,2,[3,4])
	imshow(y_comp) 
	title('Y - Component')
figure(3)
	imshow(img_sobel_edges_no_thresholding) 
	title('Sobel Edge Detection With No Thresholding')
figure(4)
	imshow(img_sobel_edges) 
	title('Sobel Edge Detection With Thresholding')
%% Outputting Images 

currentFolder = pwd;
File   = 'soble_edge_detection_output.jpg';
imwrite(img_sobel_edges, fullfile(currentFolder, File));