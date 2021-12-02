auto = imread('autodromooriginal.jpg');
autopre = imread('autopre.jpg');
%Pre
%autogray = rgb2gray(auto);
%imshow(autogray);
%h = imcontrast
%autocons = imread('autodromoconstrast.jpg');
%autoc = rgb2gray(autocons);
SE = strel('diamond', 1);
%auto1 = imclose(autoc,SE);
%SE2 = strel('disk',5);
SE3 = strel('disk',1);
%auto2 = imtophat(auto1,SE2);
%a = imdilate(auto1,SE);
%b = imtophat(a,SE2);
%c = imbinarize(imcomplement(b),0.8);
%imshowpair(b,c,'montage');
%pos
SE2 = strel('diamond', 2);
imshow(autopre);
autogray = rgb2gray(autopre);
imshow(autogray);
autopre2 = imbinarize(autogray,0.12);
imshow(autopre2)
autopre3 = bwareaopen(autopre2,1000);
%imshow(autopre3)
autopre4 = imdilate(autopre3,SE);
%imshow(autopre4)
autopre5 = bwareaopen(autopre4,15000);
%imshow(autopre5)
autopre6 = imerode(autopre5,SE);
%imshow(autopre6)
autopre7 = imcomplement(autopre6);
autopre8 = bwareaopen(autopre7,24000);
%imshow(autopre8)
autopre10 = imerode(autopre8,SE);
%imshow(autopre10)
autopre11 = bwareaopen(autopre10,10000);
%imshow(autopre11)
autopre12 = imdilate(autopre11,SE);
%imshow(autopre12)
autopre13 = imcomplement(autopre12);
background = im2uint8(autopre13) == 0;
redChannel = im2uint8(autogray);
redChannel(background) = 255;
mask = cat(3, redChannel, autogray, autogray);
imshow(mask);