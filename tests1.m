function [note1] = tests1() 
dir = './fichiers_wav/';
noms{1} = 'agauche1.wav';
noms{2} = 'adroite1.wav';
noms{3} = 'avance1.wav';
noms{4} = 'recule1.wav';
noms{5} = 'enhaut1.wav';
noms{6} = 'enbas1.wav';
points=0;
for i = 1:6
    wav_file = strcat(dir, noms{i});
    w = audioread(wav_file)';
    [scores, nomsBase] = compareBase(w, dir);
    fprintf('----------------------\nScores obtenus pour le son %d (%s) :\n',i,noms{i});
    for j = 1:size(scores,2)
        fprintf('Son %d (%s) :\t%f\n',j,nomsBase{j},scores(j));
    end
    [s,k] = sort(scores,'ascend');
    r = find(k == i);
    points = points+6-r;
end
note1 = points/90*20
