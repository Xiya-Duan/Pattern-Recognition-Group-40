%%Question 1
%%Answer: Upload myhough.m. You can run the following script to check for
%%differences. I couldn't find any.
fakeHC = myhough(edges)
%%Question 2
%%Answer: Upload a2q2.png . If you want to generate the image again, run
%%the following script:
subplot(2,2,1);
imagesc('XData',Th,'YData',Rh,'CData',hc);
title('Matlab Hough')
subplot(2,2,2);
imagesc('XData',Th,'YData',Rh,'CData',fakeHC);
title('Custom Hough')
%%Question 3
%%The answer I gave: As far as I have checked, I could not find any differences.????????????? There may have been some if I had chosen ??????????different ranges for rho and theta.??????
%%But if you can find any differences, please correct me.