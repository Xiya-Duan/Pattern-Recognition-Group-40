%%Question 1
%%Answer: A, B, D, please correct me if I'm wrong.
%%Question 2
%%Answer: A:6.;B:5.;C:1.;D:2.;E:3.;F:4.
%%Try out following script for confirmation
chess = imread('chess.jpg');
I =rgb2gray(chess);
BW = edge(I,'canny');
[H,T,R] = hough(BW);
P = houghpeaks(H,15,'threshold',ceil(0.3*max(H(:)))); 
x = T(P(:,2));
y = R(P(:,1));
plot(x,y,'s','color','red');
%%Question 3
%%Answer: upload file a3q3. If you want to generate it again, run the
%%following script:
imagesc('XData',T,'YData',R,'CData',H);
hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');
hold off;
%%Question 4
%%Answer: upload a3q4. If you want to generate it again, run the
%%following script:
%%Note: I did not know how to show the 15 strongest lines directly, so I just ordered the list of lines depending on line length and took the last 15 largest.
imshow(chess);
hold on;
lines = houghlines(BW,T,R,P);
for j = 1:1:length(lines)-1
for i = 1:1:length(lines)-1
if abs(lines(i).point1-lines(i).point2) > abs(lines(i+1).point1-lines(i+1).point2)
temp = lines(i);
lines(i)=lines(i+1);
lines(i+1)=temp;
end
end
end
for idx = length(lines):-1:length(lines)-15
xy = [lines(idx).point1; lines(idx).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% Plot beginnings and ends of lines
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
hold off;