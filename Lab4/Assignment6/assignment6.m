% Q1: order: 7, 6, 5, 1, 2, 3, 4
I = imread('dogGrayRipples.png');
I = im2double(I);
f = fft2(I); 
fs= fftshift(f);
f = abs(fs);
f = log(1+f);
imshow(f,[]);
% Q2: B, I am not sure about it.
% Q5: D
% Q6: 96; Q7: 1; Q8: 206; Q9: 1 Check workspace to confirm
[x, y] =find(f==max(f));
% Q3: 8, 7, 6, 5, 1, 3, 2, 4
rows = size(f,1);
cols = size(f,2);
center = [x'; y']; 
mask=zeros(size(f));
[xMat,yMat] = meshgrid(1:cols,1:rows);
% loop to choose the best value for r
% Q4: I think the value of r is 12
for r = 12
    for i =1:size(center,2)
        distFromCenter = sqrt((xMat-center(1,i)).^2 + (yMat-center(2,i)).^2);
        mask(distFromCenter<=r)=1;
    end
    % figure
    % imshow(~mask,[]);title('Mask');
    fs=fs.*(~mask);
    f = ifftshift(fs);
    I = real(ifft2(f));
    figure, imshow(I, []), title('s3700283');
end
% Q10: 1, 2, 3, 4
% Q11:change the title to your student card number, save the best image 
% and upload it.
