function Y=calculVecteurAcoustique(a)
%LISSAGE Summary of this function goes here
%   Detailed explanation goes here

%a = audioread('./fichiers_wav/adroite2.wav')';
%subplot(1,4,1), plot(a);

%taille de la fenetre
ftaille = 240;

%fenetre de hamming
h = hamming(ftaille)';
%subplot(1,2,1), plot(h);

%coefficient filtre passe bas
x = 15;
%decalage de la fenetre
decal = 80;

size = length(a)/decal;

 
for i=1:round(size)
     if(length(a)>ftaille+decal*i)
        %fenetre temporelle
        w=a(1+decal*i:ftaille+decal*i);
        %subplot(1,2,2), plot(w);

        %fenetre recouvrante
        e = w .* h;

        %subplot(1,4,4), plot(fh);
        %plot(e);

        %calcul de logspectre
        s = log(abs(fft(e)));
        %plot(s);

        %calcul cepstre
        c = real(fft(s));
        %plot(c);

        %filtre passe bas
        c(x :ftaille - x) = 0;
        %plot(c);

        %formants
        formant = real(ifft(c));

        %plot(formant);
        M{i}=formant;
     end
end
Y=M;
end

