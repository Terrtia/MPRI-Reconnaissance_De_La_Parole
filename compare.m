function [score] = compare(motTeste,motBase)

%vecteur acoustique motBase
vb = calculVecteurAcoustique(motBase);

%vecteur acoustique motTeste
vt = calculVecteurAcoustique(motTeste);

vb_size = size(vb,2);
vt_size = size(vt,2);

%calcul du tableau des distance locales
for i = 1:vb_size
    for j = 1:vt_size
        d{i,j} = dist(vb{i},vt{j});
    end
end

%calucl du chemin
for j =  1:vt_size
    min = min(min(D(i,j+1),D(i+1,j+1)),D(i+1,j));
    D(i+1,j)=d(i+1,j)+min;
end

score = 1;
end
