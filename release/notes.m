img=imread('Jeff_N_Trim0001-1.tif');
out = getEigenEye(img);
[x,y]=getEye(img,out);
imshow(img);
hold on
plot(x,y,'y+','MarkerSize',5,'LineWidth', 2);



this is for 2 eyes but need to tune a little bit more
img=imread('Jeff_N_Trim0000.jpg');
[m,n,p]=size(img);
left=img(1:m,1:n/2,:);
right=img(1:m,((n/2)+1):n,:);
[x y xx yy] = getEyes(left,right);
xx=xx+n/2;
imshow(img); hold on
plot(x,y,xx,yy,'y+','MarkerSize',5,'LineWidth', 2);