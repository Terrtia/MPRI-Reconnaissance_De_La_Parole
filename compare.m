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
        %distance euclidienne
        d{i,j} = sqrt(sum((vb{i}-vt{j}).^2));
    end
end


%calucl du chemin
%M = distance precedents
D=d;
tab_chemin = d;
for j =  1:vt_size
    for i = 1:vb_size
        if j == 1 && i == 1
            M = 0;
            tab_chemin{i,j} = 0;
        elseif i == 1
            M = D{i,j-1};
            tab_chemin{i,j} = tab_chemin{i,j-1} +1;
        elseif j == 1
            M = D{i-1,j};
            tab_chemin{i,j} = tab_chemin{i-1,j}+1; 
        else   
            M = min(min(D{i,j-1},D{i-1,j-1}),D{i-1,j});
            if M == D{i,j-1}
                tab_chemin{i,j} = 1+tab_chemin{i,j-1};
            elseif M==D{i-1,j-1}
                tab_chemin{i,j} = 1+tab_chemin{i-1,j-1};
            elseif M==D{i-1,j}
                tab_chemin{i,j} = tab_chemin{i-1,j};
            end
        end
        D{i,j}=d{i,j}+ M ;
    end
end

score = D{vb_size,vt_size}/tab_chemin{vb_size,vt_size};
end
