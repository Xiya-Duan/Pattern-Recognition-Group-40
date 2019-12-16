%%Question 1:
%%Answer J:
c = imread('cameraman.tif');
%%Question 2:
%%Answer A:
edges = edge(c, 'canny');
hc = hough(edges);
%%Question 3:
%%Answer: Upload a1q3. Run following code if you want to generate image
%%again.
[hc,Th,Rh] = hough(edges);
imagesc('XData',Th,'YData',Rh,'CData',hc);
xlabel('\theta (degrees)');ylabel('\rho');
%%Remember to change the title to your student number.
title('s3928594');
%%Question 4:
hcTh = hc;
hcTh(hcTh < 0.999 * max(hc(:))) = 0;
%%Question 5:
%%Answer: Upload a1q5. Run following code if you want to generate image
%%again.
peaks = houghpeaks(hc,5);
hold on;
plot(Th(peaks(:,2)),Rh(peaks(:,1)),'s','color','white');
%%Question 6:
%%Answer A:5.; B:1.; C:2.; D:3.;E:4.
%%Question 7:
%%Answer: Upload a1q7. Run following code if you want to generate image
%%again.
%%Disclaimer: I am not sure how correct this is... The line looks... weird.
hold off;
imshow(c);
theta=Th(peaks(:,2));
r=Rh(peaks(:,1));
hold on;
myhoughline(c,r,theta);
%%Remember to change the title to your student number.
title('s3928594');
%%Question 8:
%%Answer: C
%%Question 9:
%%Upload a1q9 which is this file after removing the comments. Remember to
%%change the student code.