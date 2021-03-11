function [word] = getADCreadingFrom(filePath)
% Sou��st �e�en� dom�c�ho �kolu ��slo 1 z p�edm�tu SME v letn�m semestru 2021 na FEL �VUT v Praze.
% (Protokol z m��en� nap�t� AD p�evodn�ky).
% Interprets the specified file as measurement log and extracts all
% measured ADC words. Their values is then averaged to handle edge cases
% when the converter would tend to oscillate around 1 lsb.
data = readmatrix(filePath);

isStable = data(:, 1) == 0;
stableData = data(isStable, :); % Zvol jen data, p�i kter�ch byl p�evod hotov�

words = stableData(:, 11); % P�eve� jednotliv� sloupce na bin�rn� slovo
for i = 6:-1:0
    words = words * 2 + stableData(:, 4+i);
end

word = mean(words);
end

