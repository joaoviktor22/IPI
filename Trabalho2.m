cookies = imread('cookies.tif');
cells = imread('img_cells.jpg');
test = imread('morf_test.png');
%questao1

%fechamento e abertura
se = strel('disk',3);
test1 = imopen(test,se);
test2 = imclose(test,se);
%imshowpair(test,test1,'montage')
%imshowpair(test,test2,'montage')

%esqueletizar
imagecomplement = imcomplement(test);
test3 = imbinarize(imagecomplement);
test4 = imcomplement(test3);
%imshowpair(test,test4,'montage')%maybe

%perimetrizar NAO FUNFA NESSA IMAGEM
test5 = bwperim(test,8);
%imshowpair(test,test5,'montage')

%hit-miss
interval = [0  1  1
            1  -1  1
            0  1  0];
test6 = bwhitmiss(test,interval);
%imshowpair(test,test6,'montage')

%top-hat
se2 = strel('disk',15);
test7 = imtophat(test,se2);
%imshowpair(test,test7,'montage')
%bot-hat
se3 = strel('disk',30);
test8 = imbothat(test,se3);
%imshowpair(test,test8,'montage')
%Conjunto top-hat bot-hat
se4 = strel('disk',15);
test9 = imsubtract(imadd(test,imtophat(test,se4)),imbothat(test,se4));
imshowpair(test,test9,'montage')

%erosao
se5 = offsetstrel('ball',5,5);
se6 = strel('line',11,90);
test10 = imerode(test,se5);
%imshowpair(test,test10,'montage')
test11 = imerode(test,se6);
%imshowpair(test,test11,'montage')

%dilatacao
se7 = offsetstrel('ball',5,5);
se8 = strel('line',2,90);
test12 = imdilate(test,se7);
%imshowpair(test,test12,'montage')
test13 = imdilate(test,se8);
%imshowpair(test,test13,'montage')

%binarizar
test14 = imbinarize(test,0.65);
%imshowpair(test,test14,'montage')

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