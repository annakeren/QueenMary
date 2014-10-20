function [] = ICV_visualizeHistogram( freqR,  freqG, freqB)
%the function builds three bar charts for every colour

figure ('name', 'red') ;
bar(freqR(:, 1),freqR(1, :), 'FaceColor', 'r','EdgeColor','r');

figure ('name', 'green') ;
bar(freqG(:, 1),freqG(1, :), 'FaceColor', 'g','EdgeColor','g');

figure ('name', 'blue') ;
bar(freqB(:, 1),freqB(1, :), 'FaceColor', 'b','EdgeColor','b');

end

