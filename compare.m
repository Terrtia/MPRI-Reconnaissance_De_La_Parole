function [score] = compare(motTeste,motBase)

%vecteur acoustique motBase
vb = calculVecteurAcoustique(motBase);

%vecteur acoustique motTeste
vt = calculVecteurAcoustique(motTeste);

score = 1;
end
