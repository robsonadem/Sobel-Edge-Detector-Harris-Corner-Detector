# Sobel-Edge-Detector-Harris-Corner-Detector

## Edge Detection:

I implemented the Sobel edge operator using the method shown below.

```
Figure 1 : Sobel Edge Detection Algorithm Source Lecture Slides 
```
The combination of the smoothing of the images and the derivative filtering in x
yields the Sobel edge operator. As such, I was able to follow the following steps
to extract the edges of any given image. The implementation of this algorithm is
done with mat lab, and I have listed the respective results and codes for each
step.


```
a) A function that implements the convolution of a 3x3 operator (or kernel)
with an image.
```
The above function flips the kernel and computes a convolution of the
kernel with the image in a “3 by 3 window’’. For this step, the convolution at
the edges is ignored. However, along the edges of the new image from the
convolution zeros were assigned as a placeholder. One can decide to crop the
edges, but I did not deem it necessary.

```
b) Using the code from a) convolved the given image (image2.jpg) with the
Sobel operator for both x and y direction as indicated in the lecture slide
22.
c) Displayed the output for both x and y component (called it as x_comp.jpg
and y_comp.jpg, respectively).
d) Computed the edge response by combining the x and y component. The
magnitude at each pixel can be obtained by making use of the equation
given in slide 24 of Lecture 4 (Edges).
e) Applied Thresholding to get the final edge map.
```
```
Figure 2 : Custom Convolution
```

Following step a), as shown in figure 3, I utilized the function I created to
output two new images, one being the derivative in x, and the other being the
derivative in y. These two images are displayed in figure 4. Then, I was able to
combine these two images to find the edge response of the image. After some
meticulous study for a suitable threshold value, I enhanced the initial edge
response of the image as shown below in Figures 4a and 4b.

```
Figure 3 : Sobel Edge Detection Implementation by Robson Adem
```

_Figure 4 a: Original Image and the extracted X and Y components_


_Figure 4b: Sobel Edge Detection with and without thresholding_


## Corner Detection:

I Implemented the Harris Corner Detector and showcased the outputs with and
without thresholding for the two given images.


The steps I took to implement the algorithms are as follows.

a) Used the Sobel edge operators in the x and y direction for computing the
image derivatives or the gradients Ix and Iy.

b) Found the pixel by pixel products of the gradient images to obtain three new
images (Ixx, Iyy, and Ixy).

c) Using the function W(x, y) with a 3x3 kernel of all ones, I obtained the three
smoothed images (Sxx, Syy, Sxy).

d) Implemented the measure of corners (R) and employed thresholding
techniques to find better corners. I have documented the results as follows.


### Figure 5 : Results for given image 1 (R > 80)



### Figure 6 : Results for given Image 2 (R > 15)


