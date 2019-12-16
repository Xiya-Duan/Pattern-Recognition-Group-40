%%Question 1:
%%Answer J:
c = imread('cameraman.tif');
%%Question 2:
%%Answer A:
edges = edge(c, 'canny');
hc = hough(edges);
%%Question 3:
[hc,Th,Rh] = hough(edges);
imagesc('XData',Th,'YData',Rh,'CData',hc);
xlabel('\theta (degrees)');ylabel('\rho');
title('s3928594');
%%Question 4:
hcTh = hc;
hcTh(hcTh < 0.999 * max(hc(:))) = 0;
%%Question 5:
peaks = houghpeaks(hc,5);
hold on;
plot(Th(peaks(:,2)),Rh(peaks(:,1)),'s','color','white');
%%Question 6:
%%Answer A:5.; B:1.; C:2.; D:3.;E:4.
%%Question 7:
hold off;
imshow(c);
theta=Th(peaks(:,2));
r=Rh(peaks(:,1));
hold on;
myhoughline(c,r,theta);
title('s3928594');
%%Question 8:
%%Answer: C
%%Question 9:
%%This file.