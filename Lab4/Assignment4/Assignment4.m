%%Question 1
%%Answer: Upload a4q1.png. To generate image again, run following script:
headtool=imread('HeadTool0002.bmp');
doublePrec=im2double(headtool);
contrastLimited=adapthisteq(doublePrec);
imshow(contrastLimited);
[centers, radii] = imfindcircles(contrastLimited,[20 40],'Method','TwoStage');
viscircles(centers,radii,'EdgeColor','b');
%%Question 2
%%Answer: Upload a4q1.png. To generate image again, run following script:
headtool=imread('HeadTool0002.bmp');
doublePrec=im2double(headtool);
contrastLimited=adapthisteq(doublePrec);
imshow(contrastLimited);
[centers, radii] = imfindcircles(contrastLimited,[20 40],'Method','TwoStage');
centers_strong_2 = centers(1:2,:);
radii_strong_2 = radii(1:2);
viscircles(centers_strong_2,radii_strong_2,'EdgeColor','r');
%%Question 3
%%Answer: upload this file.