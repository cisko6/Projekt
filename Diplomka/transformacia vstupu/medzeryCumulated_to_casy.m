
clear;clc

% vstup kumulovane medzery - neignoruje nuly

M = importdata("C:\Users\patri\Desktop\diplomka\Zaznamy\záznamy\Real Utoky\Ver_data.txt");
%M = readtable("C:\Users\patri\Desktop\diplomka\Zaznamy\záznamy\Real Utoky\fri-01-20141113.Time\fri-01-20141113.Time.csv");
n1 = numel(M);
data = M;


%data = M(1:ceil(n1/10)); %0207
slot_window = 0.01;       %0207

%data = M(500000:ceil(n1/6)); %0402
%slot_window = 0.1;       %0402

%data = M(20000:n1/20); %0504a
%slot_window = 0.01;    %0504a

%data = M(15*n1/40:17*n1/40); %0504b
%slot_window = 0.01;    %0504b

%data = M(27*n1/40:31*n1/40); %0504c
%slot_window = 0.1;    %0504c

%data = M(1:n1/20); %0605a
%slot_window = 0.01;    %0605a

%data = M(6*n1/20:7*n1/20); %0605b
%slot_window = 0.01;    %0605b

%data = M(4*n1/32:6*n1/32); %0701
%slot_window = 0.1;    %0701

sampled_data = cumulatedSpaces_to_casy(data,slot_window);
plot(sampled_data)


function sampled_data = cumulatedSpaces_to_casy(kumul_medzery, slot_window)

    maxTime = max(kumul_medzery);
    numBins = ceil(maxTime / slot_window) + 1;
    
    sampled_data = zeros(1, numBins);
    
    for i = 1:length(kumul_medzery)
        binIndex = floor(kumul_medzery(i) / slot_window) + 1;
        
        sampled_data(binIndex) = sampled_data(binIndex) + 1;
    end
end
