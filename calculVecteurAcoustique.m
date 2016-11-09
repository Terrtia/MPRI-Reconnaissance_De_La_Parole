function Y=calculVecteurAcoustique(a)
%LISSAGE Summary of this function goes here
%   Detailed explanation goes here

%taille de la fenetre
ftaille = 240;

%fenetre de hamming
h = hamming(ftaille)';


%coefficient filtre passe bas
x = 15;
%decalage de la fenetre
decal = 80;

size = length(a)/decal;

 
for i=1:round(size)
     if(length(a)>ftaille+decal*i)
        %fenetre temporelle
        w=a(1+decal*i:ftaille+decal*i);

        %fenetre recouvrante
        e = w .* h;

        %calcul de logspectre
        s = log(abs(fft(e)));

        %calcul cepstre
        c = real(fft(s));

        %filtre passe bas
        c(x :ftaille - x) = 0;

        %formants
        formant = real(ifft(c));

        M{i}=formant;
     end
end
Y=M;
end

