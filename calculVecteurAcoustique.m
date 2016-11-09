function Y=calculVecteurAcoustique(a)
%LISSAGE Summary of this function goes here
%   Detailed explanation goes here

size = length(a)/160;

%fenetre de hamming
h = hamming(480)';

%coefficient filtre passe bas
x = 25;
 
for i=1:round(size)
     if(length(a)>480+160*i)
         
        %fenetre temporelle
        w=a(1+160*i:480+160*i);

        %fenetre recouvrante
        e = w .* h;

        %calcul de logspectre
        s = log(abs(fft(e)));

        %calcul cepstre
        c = real(fft(s));

        %filtre passe bas
        c(x :480 - x) = 0;

        %formants
        formant = real(ifft(c));

        M{i}=formant;
     end
end
Y=M;
end

