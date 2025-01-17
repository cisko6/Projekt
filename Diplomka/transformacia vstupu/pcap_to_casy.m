
%clear;clc

folder_path = "C:\Users\patri\Desktop\najdene utoky\biedne\A7\Wednesday-part_0.pcap";
pcapAll = pcapReader(folder_path);
%pcap = pcapAll.readAll; % toto zakomentovat ked nechcem cakat rok
pcap2 = pcap(25000:400000);
[~, folder_name, ~] = fileparts(folder_path);

slot_window = 0.1;
sampled_data = sample_pcap(pcap2, slot_window);
plot(sampled_data)
title("pcap "+folder_name+" slot window="+slot_window)


function sampled_data = sample_pcap(pcap, slot_window)
    data_casy = datetime([pcap(:).Timestamp] / 1e6, 'ConvertFrom', 'posixtime');

    tStart = min(data_casy);
    tEnd = max(data_casy);
    
    timeBins = tStart:seconds(slot_window):tEnd;
    
    [sampled_data, ~] = histcounts(data_casy, timeBins);
end