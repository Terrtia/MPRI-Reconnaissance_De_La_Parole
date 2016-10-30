function Y=calculVecteurAcoustique(a)
%LISSAGE Summary of this function goes here
%   Detailed explanation goes here

%a = audioread('./fichiers_wav/adroite2.wav')';
%subplot(1,4,1), plot(a);

size = length(a)/160;

%fenetre de hamming
h = hamming(480)';
%subplot(1,2,1), plot(h);

%coefficient filtre passe bas
x = 25;
 
for i=1:round(size)
     if(length(a)>480+160*i)
        %fenetre temporelle
        w=a(1+160*i:480+160*i);
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
        c(x :480 - x) = 0;
        %plot(c);

        %formants
        formant = real(ifft(c));

        %plot(formant);
        M{i}=formant;
     end
end
Y=M;
end

