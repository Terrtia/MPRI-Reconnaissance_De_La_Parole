function lissage()
%LISSAGE Summary of this function goes here
%   Detailed explanation goes here

a = audioread('fichiers_wav/adroite1.wav');
%subplot(1,4,1), plot(a);

w = a(1001:1480);
%subplot(1,4,2), plot(w);

h = hamming(480);
%subplot(1,4,3), plot(h);

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
x = 25;
c(x :480 - x) = 0;
%plot(c);

%formants
formant = real(ifft(c));
plot(formant);

end

