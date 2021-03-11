function [word] = getADCreadingFrom(filePath)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data = readmatrix(filePath);

isStable = data(:, 1) == 0;
stableData = data(isStable, :); % Zvol jen data, pøi kterých byl pøevod hotový

words = stableData(:, 11); % Pøeveï jednotlivé sloupce na binární slovo
for i = 6:-1:0
    words = words * 2 + stableData(:, 4+i);
end

word = mean(words);
end

