clc; clear; close all;

n = 15;
Nodes = node.empty(0,n);
duongdays = duongday.empty(0,n-1);

% Nhap thong so cua nut
Nodes(1).name = 1; Nodes(1).P = 4; Nodes(1).cosphi = 0.85; Nodes(1).Udm = 22;  Nodes(1).PV = 2;
Nodes(2).name = 2; Nodes(2).P = 6; Nodes(2).cosphi = 0.85; Nodes(2).Udm = 22;  Nodes(2).PV = 3;
Nodes(3).name = 3; Nodes(3).P = 7; Nodes(3).cosphi = 0.85; Nodes(3).Udm = 22; Nodes(3).PV = 3;
Nodes(4).name = 4; Nodes(4).P = 3; Nodes(4).cosphi = 0.85; Nodes(4).Udm = 22;  Nodes(4).PV = 2;
Nodes(5).name = 5; Nodes(5).P = 8; Nodes(5).cosphi = 0.85; Nodes(5).Udm = 22; Nodes(5).PV = 2;
Nodes(6).name = 6; Nodes(6).P = 9; Nodes(6).cosphi = 0.85; Nodes(6).Udm = 22;  Nodes(6).PV = 2;
Nodes(7).name = 7; Nodes(7).P = 10; Nodes(7).cosphi = 0.85; Nodes(7).Udm = 22;  Nodes(7).PV = 2;
Nodes(8).name = 8; Nodes(8).P = 5; Nodes(8).cosphi = 0.85; Nodes(8).Udm = 22;  Nodes(8).PV = 2;
Nodes(9).name = 9; Nodes(9).P = 7; Nodes(9).cosphi = 0.85; Nodes(9).Udm = 22; Nodes(9).PV = 2;
Nodes(10).name = 10; Nodes(10).P = 6; Nodes(10).cosphi = 0.85; Nodes(10).Udm = 22; Nodes(10).PV = 2;
Nodes(11).name = 11; Nodes(11).P = 2; Nodes(11).cosphi = 0.85; Nodes(11).Udm = 22; Nodes(11).PV = 2;
Nodes(12).name = 12; Nodes(12).P = 5; Nodes(12).cosphi = 0.85; Nodes(12).Udm = 22;  Nodes(12).PV = 2;
Nodes(13).name = 13; Nodes(13).P = 7; Nodes(13).cosphi = 0.85; Nodes(13).Udm = 22;  Nodes(13).PV = 2;
Nodes(14).name = 14; Nodes(14).P = 8; Nodes(14).cosphi = 0.85; Nodes(14).Udm = 22;  Nodes(14).PV = 2;
Nodes(15).name = 15; Nodes(15).P = 8; Nodes(15).cosphi = 0.85; Nodes(15).Udm = 22; Nodes(15).PV = 2;


% Nhap thong so duong day
duongdays(1).nut = [1, 3]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(2).nut = [3, 4]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(3).nut = [4, 9]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(4).nut = [9, 10]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(5).nut = [9, 14]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(6).nut = [1, 2]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(7).nut = [2, 6]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(8).nut = [6, 5]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(9).nut = [6, 7]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(10).nut = [7, 11]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(11).nut = [5, 8]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(12).nut = [8, 12]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(13).nut = [8, 13]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;
duongdays(14).nut = [13, 15]; duongdays(1).R = 0.01; duongdays(1).L = 0.02; duongdays(1).X = 0.015; duongdays(1).L = 15;

% Tinh nut trai va phai cua day
nut_trai = [];
nut_phai = [];
for i = 1 : n-1
    nut_trai(length(nut_trai)+1) = duongdays(i).nut(1); 
    nut_phai(length(nut_phai)+1) = duongdays(i).nut(2); 
end

% Tinh bac 1 cua day va nut

for nut = 1 : n
    warn = false;
    for day = 1 : n -1
        if nut == nut_trai(day)
           warn = true; 
        end
    end
    if warn == false
        Nodes(nut).bac = 1;
    end
end





















