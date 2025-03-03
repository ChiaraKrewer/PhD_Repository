%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% SCION - Spatial Continuous Integration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Earth Evolution Model %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Coded by BJW Mills
%%%% b.mills@leeds.ac.uk
%%%%
%%%% plot model fluxes

%%%% output to screen
fprintf('running plotting script... \t')
tic
global state

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   define colorbars   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% IPCC precip colorbar modified
IPCC_pre = [ 223 194 125 ;
246 232 195 ;
245 245 245 ;
199 234 229 ;
128 205 193 ;
53 151 143 ;
1 102 94 ;
0 60 48 ] ./ 255 ;

%%%% IPCC temp colorbar
IPCC_temp = flipud( [103 0 31 ;
178 24 43 ;
214 96 77 ;
244 165 130 ;
253 219 199 ;
247 247 247 ;
209 229 240 ;
146 197 222 ;
67 147 195 ;
33 102 172 ;
5 48 97 ]./ 255 ) ;

%%%% IPCC sequential
IPCC_seq = [255 255 204 ;
161 218 180 ;
65 182 196 ;
44 127 184 ;
37 52 148] ./ 255 ;

%%%% IPCC sequential 2
IPCC_seq_2 = [ 237 248 251 ;
179 205 227 ;
140 150 198 ;
136 86 167 ;
129 15 124 ] ./ 255 ;

%%%% Proxy color chart
pc1 = [65 195 199]./255 ;
pc2 = [73 167 187]./255 ;
pc3 = [82 144 170]./255 ;
pc4 = [88 119 149]./255 ;
pc5 = [89 96 125]./255 ;
pc6 = [82 56 100]./255 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Plot global variables   %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% load geochem data
load('data\geochem_data_2020.mat')
load('data\Scotese_GAT_2021.mat')

%%%%%%% make figure
figure('Color',[1 0.98 0.95])

% %%%% inputs
subplot(4,3,1)
hold on
box on
plot(state.time_myr,state.CO2_input,'--', 'Color', [0.23 0.53 0.97], 'displayname','CO_{2}')
plot(state.time_myr,state.add_P_input,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','P')
xlabel('Time (Ma)')
ylabel({'input';'(mol a^{-1})'})
xlim([-96 -92])
ylim([0 15e12])
title('inputs')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

%%% O2 (%) 
subplot(4,3,2)
hold on
box on
xlim([-96 -92])
ylim([25 40])
xlabel('Time (Ma)')
ylabel('Atmospheric O_{2} (%)')
%%%% plot data comparison
for u = 1:2:length(O2_x) - 1
   plot( [O2_x(u) O2_x(u)] , [O2_y(u) O2_y(u+1)] , 'color' , pc2  ) ;     
end
%%%% plot this model
plot(state.time_myr,state.mrO2.*100,'k')

%%%% CO2ppm
subplot(4,3,3)
% set(gca, 'YScale', 'log')
hold on
box on
set(gca, 'YScale', 'log')
xlim([-96 -92])
% ylim([800 5000 ])
ylim([800 15000])
xlabel('Time (Ma)')
ylabel('Atmospheric CO_{2} (ppm)')
%%%% plot data comparison
%%%% paleosol
% errorbar(paleosol_age,paleosol_co2,paleosol_low,paleosol_high,'color',[0.4 0.7 0.7],'linestyle','none')
plot(paleosol_age, paleosol_co2,'.','markerfacecolor',pc1,'markeredgecolor',pc1)
%%%% alkenone
% errorbar(alkenone_age,alkenone_co2,alkenone_low,alkenone_high,'color',[0.4 0.7 0.4],'linestyle','none')
plot(alkenone_age, alkenone_co2,'.','markerfacecolor',pc2,'markeredgecolor',pc2)
%%%% boron
% errorbar(boron_age,boron_co2,boron_low,boron_high,'color',[0.7 0.4 0.4],'linestyle','none')
plot(boron_age, boron_co2,'.','markerfacecolor',pc3,'markeredgecolor',pc3)
%%%% stomata
% errorbar(stomata_age,stomata_co2,stomata_low,stomata_high,'color',[0.7 0.7 0.4],'linestyle','none')
plot(stomata_age, stomata_co2,'.','markerfacecolor',pc4,'markeredgecolor',pc4)
%%%% liverwort
% errorbar(liverwort_age,liverwort_co2,liverwort_low,liverwort_high,'color',[0.7 0.7 0.4],'linestyle','none')
plot(liverwort_age, liverwort_co2,'.','markerfacecolor',pc5,'markeredgecolor',pc5)
%%%% phytane
% errorbar(phytane_age,phytane_co2,phytane_low,phytane_high,'color',[0.7 0.7 0.4],'linestyle','none')
plot(phytane_age, phytane_co2,'.','markerfacecolor',pc6,'markeredgecolor',pc6)
%%%% plot this model
semilogy(state.time_myr,state.RCO2.*280,'k')


%%% TEMP
subplot(4,3,4)
hold on
box on
xlim([-96 -92])
ylim([18 42])
xlabel('Time (Ma)')
ylabel('Temperature (C)')
%%%% plot data comparison
% patch(T_x,T_y,pc1,'edgecolor','none')
% plot(Scotese_2021_age,Scotese_2021_GAT,'color',pc1)
%%%% plot this model
plot(state.time_myr,state.tempC,'k','DisplayName','GAST')
plot(state.time_myr,state.SAT_equator,'r', 'DisplayName','tropics')
plot(state.time_myr,state.SAT_hilat,'r', 'DisplayName','hilat')
%%% plot data compilation
data_t = xlsread('C_temp.xlsx','','','basic') ;
hold on
plot([data_t(1:563,1)],[data_t(1:563,2)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','k', 'MarkerSize', 2, 'displayname', 'high-lat. sites')
plot([data_t(1:28,5)],[data_t(1:28,6)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','r', 'MarkerSize', 2, 'displayname', 'tropical sites')
plot([data_t(1:76,8)],[data_t(1:76,9)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','r', 'MarkerSize', 2, 'displayname', 'tropical sites')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%weathering
subplot(4,3,5)
hold on
box on
set(gca, 'YScale', 'log')
xlim([-96 -92])
% ylim([0 9e13])
% ylim([0 13e13])
xlabel('Time (Ma)')
ylabel('Weathering Flux (mol/yr)')
%%%% plot this model
semilogy(state.time_myr,state.silw,'r','DisplayName','silw')
% semilogy(state.time_myr,state.carbw,'c','DisplayName','carbw')
% semilogy(state.time_myr,state.basw,'b','DisplayName','basw')
% semilogy(state.time_myr,state.granw,'k','DisplayName','granw') 
% semilogy(state.time_myr,state.phosw,'k','DisplayName','phosw') 
%%% Legend,
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
text(-590,28e12,'silw','color','r')
% text(-590,24e12,'carbw','color','c')
% text(-590,20e12,'sfw','color','b')
% text(-590,16e12,'mccb','color','k')
% %%%% Title
title('Weathering fluxes')

%%%% d13C record
subplot(4,3,6)
hold on
box on
xlim([-96 -92])
% ylim([-1 5])
ylim([-2 5])
xlabel('Time (Ma)')
ylabel('\delta^{13}C_{carb}')
%%%% plot total Ccarb compilation
data1 = xlsread('Ccarb_isotope_compilation.xlsx','','','basic') ;
xlim([-96 -92])
hold on
%background
plot([-94.65 -94.65],[mean(data1(1:215,1))],'x','MarkerIndices',1, 'color','k')
plot([-94.8 -94.50 -94.50 -94.8 -94.8], [quantile(data1(1:215,1),0.25) quantile(data1(1:215,1),0.25) quantile(data1(1:215,1),0.75) quantile(data1(1:215,1),0.75) quantile(data1(1:215,1),0.25)], 'linewidth',0.5 ,'color','k')
% onset
plot([-94.38 -94.38],[mean(data1(1:313,5))],'x','MarkerIndices',1,'color','k')
plot([-94.50 -94.27 -94.27 -94.5 -94.5], [quantile(data1(1:313,5),0.25) quantile(data1(1:313,5),0.25) quantile(data1(1:313,5),0.75) quantile(data1(1:313,5),0.75) quantile(data1(1:313,5),0.25)], 'linewidth',0.5,'color','k')
% plateau
plot([-94.1 -94.1],[mean(data1(1:407,9))],'x','MarkerIndices',1, 'color','k')
plot([-94.27 -93.90 -93.9 -94.27 -94.27], [quantile(data1(1:407,9),0.25) quantile(data1(1:407,9),0.25) quantile(data1(1:407,9),0.75) quantile(data1(1:407,9),0.75) quantile(data1(1:407,9),0.25)], 'linewidth',0.5,'color','k')
% Recovery
plot([-93.86 -93.86],[mean(data1(1:175,13))],'x','MarkerIndices',1, 'color','k')
plot([-93.90 -93.81 -93.81 -93.9 -93.9], [quantile(data1(1:175,13),0.25) quantile(data1(1:175,13),0.25) quantile(data1(1:175,13),0.75) quantile(data1(1:175,13),0.75) quantile(data1(1:175,13),0.25)], 'linewidth',0.5,'color','k')
% background
plot([-93.65 -93.65],[mean(data1(1:229,17))],'x','MarkerIndices',1, 'color','k')
plot([-93.81 -93.5 -93.5 -93.81 -93.81], [quantile(data1(1:229,17),0.25) quantile(data1(1:229,17),0.25) quantile(data1(1:229,17),0.75) quantile(data1(1:229,17),0.75) quantile(data1(1:229,17),0.25)], 'linewidth',0.5,'color','k')
% %%%% plot data comparison
% plot(d13c_x,d13c_y,'.','color',pc2)
%%%% plot this model
plot(state.time_myr,state.delta_mccb,'k')

% %%ANoxia
subplot(4,3,7)
hold on
box on
set(gca, 'YScale', 'log')
xlim([-96 -92])
ylim([0 1])
% set(gca, 'YScale', 'log')
xlabel('Time (Ma)')
ylabel('anoxia')
%%%% plot this model
semilogy(state.time_myr,state.ANOX,'k')
% semilogy(state.time_myr,state.ANOX*2000,'k') %%shelf anoxia in %


%%% Corg flux
subplot(4,3,8)
hold on
box on
xlim([-96 -92])
ylim([0 8e12])
% ylim([0 10e12])
set(gca, 'YScale', 'log')
xlabel('Time (Ma)')
ylabel('Flux (mol/yr)')
%%%% plot this model
semilogy(state.time_myr,state.mocb,'b', 'DisplayName','mocb')
% semilogy(state.time_myr,state.locb,'g','DisplayName','locb')
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
text(-590,5e12,'mocb','color','b')
text(-590,4e12,'locb','color','g')
text(-590,3e12,'oxidw','color','r')
text(-590,2e12,'ocdeg','color','k')
%%%% Title
title('C_{org} fluxes')

% %%%% Nuts conc
subplot(4,3,9)
hold on
box on
plot(state.time_myr,state.P,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','P')
% plot(state.time_myr,state.S,':', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','Sulfate')
xlabel('Time (Ma)')
ylabel({'conc';'(mol/L)'})
xlim([-96 -92])
% ylim([0 6e10])
title('P conc')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

%%Phosphate weathering
subplot(4,3,10)
hold on
box on
set(gca, 'YScale', 'log')
xlim([-96 -92])
ylim([5e10 5e11])
xlabel('Time (Ma)')
ylabel('Weathering Flux (mol/yr)')
%%%% plot this model
semilogy(state.time_myr,state.phosw,'k','DisplayName','phosw') 


%%%% GLOBAL FORCINGS
subplot(4,3,10)
hold on
box on
xlim([-96 -92])
%ylim([pars.whenstart/1e6 pars.whenend/1e6])
ylim([0 2.5])
xlabel('Time (Ma)')
ylabel('Relative forcing')
%%%% plot this model
plot(state.time_myr,state.DEGASS,'r','displayname', 'D')
plot(state.time_myr,state.BAS_AREA,'k', 'DisplayName','BA')
plot(state.time_myr,state.EVO,'g','DisplayName','E')
plot(state.time_myr,state.W,'b','DisplayName','W')
plot(state.time_myr,state.Bforcing,'m','DisplayName','B')
plot(state.time_myr,state.GRAN_AREA,'color',[0.8 0.8 0.8], 'DisplayName','GA')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
text(-590,2.4,'D','color','r')
text(-590,2.2,'E','color','g')
text(-590,2,'W','color','b')
text(-590,1.8,'B','color','m')
text(-590,1.6,'BA','color','k')
text(-590,1.4,'GA','color',[0.8 0.8 0.8])
%%%% Title
title('Forcings')

%%% Carbonate burial
subplot(4,3,12)
hold on
box on
xlim([-96 -92])
ylim([1e11 1e14])
% ylim([0 10e12])
set(gca, 'YScale', 'log')
xlabel('Time (Ma)')
ylabel('burial (mol/yr)')
%%%% plot this model
semilogy(state.time_myr,state.mccb,'b', 'DisplayName','mccb')
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
text(-590,5e12,'mocb','color','b')
text(-590,4e12,'locb','color','g')
text(-590,3e12,'oxidw','color','r')
text(-590,2e12,'ocdeg','color','k')
%%%% Title
title('carbonate burial')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Cleanup workspace   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear stepnumber
clear u
clear numfields
clear trecords
clear finalrecord
clear field_names
clear n
clear veclength
clear xvec
clear yvec
clear endtime



%%%%% plotting script finished
fprintf('Done: ')
endtime = toc ;
fprintf('time (s): %d \n', endtime )
