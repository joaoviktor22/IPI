car = imread('car.png');
crowd = imread('crowd.png');
test = imread('test80.jpg');
uni = imread('university.png');
imag2 = dec_int(test,4);
imag3 = edge_improv(imag2);

imag4 = imresize(test,0.25,'bicubic');
imag5 = imresize(imag4,4,'bicubic');
imag6 = edge_improv(imag5);


car1 = imadjust(car,[],[],0.5);
car2 = imadjust(car,[],[],0.7);
car3 = imadjust(car,[],[],1.5);
car4 = imadjust(car,[],[],2.0);
%imshowpair(car1,car2,'montage')
%imshowpair(car3,car4,'montage')

crowd1 = imadjust(crowd,[],[],0.5);
crowd2 = imadjust(crowd,[],[],0.7);
crowd3 = imadjust(crowd,[],[],1.5);
crowd4 = imadjust(crowd,[],[],2.0);
%imshowpair(crowd1,crowd2,'montage')
%imshowpair(crowd3,crowd4,'montage')

uni1 = imadjust(uni,[],[],0.5);
uni2 = imadjust(uni,[],[],0.7);
uni3 = imadjust(uni,[],[],1.5);
uni4 = imadjust(uni,[],[],2.0);
%imshowpair(uni1,uni2,'montage')
%imshowpair(uni3,uni4,'montage')

car5 = histeq(car);
%imshowpair(car,car5,'montage')

crowd5 = histeq(crowd);
%imshowpair(crowd,crowd5,'montage')

uni5 = histeq(uni);
%imshowpair(uni,uni5,'montage')

figure
imhist(uni,64)
%figure
%imhist(uni5,64)

function resposta = dec_int(imagem,m)
largura=floor(length(imagem(1,:,1))*(1/m));
altura=floor(length(imagem(:,1,1))*(1/m));
for k=1:length(imagem(1,1,:))
    for j=1:largura
        for i=1:altura
            resp(i,j,k)=imagem(round((i*m)-(m-1)),round((j*m)-(m-1)),k);
        end
    end
end
largura=floor(length(resp(1,:,1))*(m));
altura=floor(length(resp(:,1,1))*(m));
for k=1:length(resp(1,1,:))
    for j=1:largura
        for i=1:altura
            for l=1:m
                for p=1:m
                    resposta(i,j,k)=resp(ceil((i/m)),ceil((j/m)),k);
                end
            end
        end
    end
end
end
function resposta = edge_improv(imagem)
H = fspecial('average',11);
If = imfilter(imagem,H);
fs = imagem-If;
A = 1.5;
resposta = imagem+A*fs;
end