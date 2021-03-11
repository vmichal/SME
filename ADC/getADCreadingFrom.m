function [word] = getADCreadingFrom(filePath)
% Souèást øešení domácího úkolu èíslo 1 z pøedmìtu SME v letním semestru 2021 na FEL ÈVUT v Praze.
% (Protokol z mìøení napìtí AD pøevodníky).
% Interprets the specified file as measurement log and extracts all
% measured ADC words. Their values is then averaged to handle edge cases
% when the converter would tend to oscillate around 1 lsb.
data = readmatrix(filePath);

isStable = data(:, 1) == 0;
stableData = data(isStable, :); % Zvol jen data, pøi kterých byl pøevod hotový

words = stableData(:, 11); % Pøeveï jednotlivé sloupce na binární slovo
for i = 6:-1:0
    words = words * 2 + stableData(:, 4+i);
end

word = mean(words);
end

