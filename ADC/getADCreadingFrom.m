function [word] = getADCreadingFrom(filePath)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data = readmatrix(filePath);

isStable = data(:, 1) == 0;
stableData = data(isStable, :); % Zvol jen data, p�i kter�ch byl p�evod hotov�

words = stableData(:, 11); % P�eve� jednotliv� sloupce na bin�rn� slovo
for i = 6:-1:0
    words = words * 2 + stableData(:, 4+i);
end

word = mean(words);
end

