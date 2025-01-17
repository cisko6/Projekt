
clc
clear

% vyskusajte na 10000 0/1 z Bernouliho p = 0.7, stredna hodnota musi byt
% priblizne ET = 3/7, diperzia 3/49?
pocet_generovanych = 1000;
p = 0.7;
max_hodnota = 1;

%generuj bernoulli
data = binornd(max_hodnota,p,1,pocet_generovanych);
%data = [1,0,1,0,0,1,1,0];

vysl = zisti_pocetnosti(data);
disp(vysl)





function vysl = zisti_pocetnosti(data)
    % zistenie početnost núl 0 00 000
    zeroLengths = [];
    zeroCount = 0;
    for i = 1:length(data)
        if data(i) == 0
            zeroCount = zeroCount + 1;
        else
            if zeroCount > 0
                zeroLengths = [zeroLengths, zeroCount];
                zeroCount = 0;
            end
        end
    end
    
    if zeroCount > 0
        zeroLengths = [zeroLengths, zeroCount];
    end
    
    vysl = zeros(1, max(zeroLengths)+1);
    for i = 1:length(zeroLengths)
        vysl(zeroLengths(i)+1) = vysl(zeroLengths(i)+1) + 1;
    end
    
    % zistenie početnosť jednotiek 11
    count = 0;
    for i = 1:length(data)-1
        if data(i) == 1 && data(i+1) == 1
            count = count + 1;
        end
    end
    vysl(1) = count;
end

