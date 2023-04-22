function [Is] = ecualizar_imagen(I)
[mf, nc, pp] = size(I);  % tamaño de la imagen
if pp == 3
    I = rgb2gray(I);  % Convertir imagen a escala de gris.
end
h = imhist(I);  %histograma.
L = 0:255;  %niveles de gris.
P = h/(mf*nc);  %probalidades de los nivels de gris.
T = cumsum(P);  %suma acomulada de probabilidades.
Is = zeros(mf, nc);
for i = 1: mf
    for j = 1: nc
        Is(i, j) = T(I(i, j) +1)*255;
    end
end
plot(L, T);
title(" suma acomulada(T) Vs tono de gris(L)");
ylabel("T");
xlabel("L");
% vector sumas acomuladas versus Li
end 