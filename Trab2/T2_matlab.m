cookies = imread('cookies.tif');
cells = imread('img_cells.jpg');
test = imread('morf_test.png');

%questao1-a
level = graythresh(test)
testbin = imbinarize(test,level);
imshow(testbin);
%imshowpair(test,testbin,'montage')

%questao1-b
se1 = strel('disk',15);
testori = imbothat(test,se1);
imagecomplement = imcomplement(testori);
se2 = strel('line',3,0);
test2 = imerode(imagecomplement,se2);
level2 = graythresh(test2)
imshow(test2);
testfinal = imbinarize(test2,level2);
imshow(testfinal);
%imshowpair(test,testfinal,'montage')

%questao2
cookies1 = imbinarize(cookies,0.4);
se1 = strel('disk',56);
se2 = strel('disk',30);
cookies2 = imerode(cookies1,se1);
imshow(cookies2);
cookies3 = imdilate(cookies2,se1);
imshow(cookies3);
cookiesfinal = cookies.*uint8(cookies3);
imshow(cookiesfinal);
%imshowpair(cookies,cookiesfinal,'montage')

%questao3
cellsg = rgb2gray(cells);
level3 = graythresh(cellsg)
cells1 = imbinarize(cellsg,level3);
imshow(cells1);
cells3 = bwareaopen(cells1,150);
imshow(cells3);
cells4 = imcomplement(cells3);
D = bwdist(cells4);
L = watershed(D);
bgm = L == 0;
%imshow(bgm)
%imshowpair(cells1,cells3,'montage')
Lrgb = label2rgb(L,'jet','w','shuffle');
imshowpair(D,Lrgb,'montage')