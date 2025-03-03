
%%% plot model
global stepnumber
global pars
global workingstate
global when
global starting
global per
global present
global state
global sensparams


%%% output to screen
fprintf('running plotting script... \t')
tic


%%%%% make figure
figure('Color',[1 0.98 0.95]);
title('Fig. 1');
%%% define colours


%%%% inputs
subplot(4,3,1);
hold on;
box on;
plot((state.time/1e6),state.CO2_input,'--', 'Color', [0.23 0.53 0.97], 'DisplayName','CO_{2}');
plot((state.time/1e6), state.add_P_input,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','P');
% xlabel('Time (Ma)');
ylabel({'input';'(mol yr^{-1})'});
xlim([-100 -90]);
% xlim([-96 -92]);
% ylim([0 15e12])
title('a');
%%%% Legend;
% l=legend;
% % fontsize(l, 'decrease');
% set(l,'edgecolor','none');
% set(l,'location','southeast');
legend('CO_{2}','P');


%%% Atmospheric CO2 in ppm
subplot(4,3,2);
hold on;
box on;
set(gca, 'YScale', 'log')
semilogy(((state.time/1e6)),(state.CO2atm*1e6),'k');
xlabel('Time (Ma)');
xlim([-100 -90]);
% xlim([-96 -92]);
ylim([0 2000])
ylabel({'Atmospheric CO_{2}';'(ppm)'});
title('b');


%%% Ocean O2 concentration in mol m^-3
subplot(4,3,3);
hold on;
box on;
plot(((state.time/1e6)),(state.O2_D/243e12),':', 'Color', [0.23 0.53 0.97], 'DisplayName','distal');
plot(((state.time/1e6)),(state.O2_S/1.6145e16),'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1, 'DisplayName','surface');
plot(((state.time/1e6)),(state.O2_P/4.5e12),'--','Color', [0.23 0.53 0.97], 'DisplayName','proximal');
plot(((state.time/1e6)),(state.O2_DP/2.21e17),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','deep');
xlabel('Time (Ma)');
ylabel({'Oceanic O_{2}';'(mol)'});
xlim([-100 -90]);
% xlim([-96 -92]);
ylim([0 2])
title('c');
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%% Temperature in C
subplot(4,3,4);
hold on;
box on;

%%% plot data
data_t = xlsread('C_temp.xlsx','','','basic') ;
xlim([-96 -92])
hold on
plot([data_t(1:563,1)],[data_t(1:563,2)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','k', 'MarkerSize', 2, 'displayname', 'high-lat. sites')
plot([data_t(1:28,5)],[data_t(1:28,6)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','r', 'MarkerSize', 2, 'displayname', 'tropical sites')
plot([data_t(1:76,8)],[data_t(1:76,9)], 'LineStyle', 'none', 'Marker', 'o', 'MarkerEdgeColor','r', 'MarkerSize', 2, 'displayname', 'tropical sites')
% %%% plot model
plot((state.time/1e6),state.GAST-273,'-', 'Color', [0.23 0.53 0.97], 'displayname' ,'GAST');
plot((state.time/1e6),state.Tsurf-273,'-', 'Color', [0.03 0.06 0.47], 'displayname', 'low lat.');
xlabel('Time (Ma)');
ylabel('Temperature (^{o}C)');
% xlim([-96 -92]);
xlim([-100 -90]);
ylim([18 40])
title('d');
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

%%%Weathering fluxes
subplot(4,3,5);
hold on;
box on;
% set(gca, 'YScale', 'log')
semilogy((state.time/1e6),state.Fsilw,'-', 'Color','k', 'displayname','total');
% plot((state.time/1e6),state.Fw,'-', 'Color','k', 'displayname','total');
% plot((state.time/1e6),state.River_SRP,':', 'Color','k', 'displayname','riverine SRP');
xlabel('Time (Ma)');
ylabel({'Weathering Fluxes';'(mol yr^{-1})'});
% xlim([-100 -90]);
xlim([-96 -92]);
ylim([1e13 1e14])
title('e');
%%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');




%%%% carbon isotopes carbonate
subplot(4,3,6);
hold on;
box on;

% %%%% plot data total Ccarb compilation
data1 = xlsread('Ccarb_isotope_compilation.xlsx','','','basic') ;
% xlim([-96 -92]);
xlim([-100 -90]);
hold on
% background
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
%plot model results 
plot((state.time/1e6),state.Aiso,'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1);
xlabel('Time (Ma)');
ylabel(['\delta^{13}C_{carb} (',char(8240),')']);
xlim([-100 -90]);
ylim([-1 5])
title('f');

% 
% % %%%% carbon isotopes POC
% % subplot(4,3,6)
% % hold on
% box on
% 
% %%%% plot data total Corg compilation
% data = xlsread('C_isotope_compilation.xlsx','','','basic') ;
% % xlim([-96 -92])
% hold on
% plot([-94.65 -94.65],[mean(data(1:368,1))],'x','MarkerIndices',1, 'color','k')
% plot([-94.8 -94.50 -94.50 -94.8 -94.8], [quantile(data(1:368,1),0.25) quantile(data(1:368,1),0.25) quantile(data(1:368,1),0.75) quantile(data(1:368,1),0.75) quantile(data(1:368,1),0.25)], 'linewidth',0.5 ,'color','k')
% 
% plot([-94.47 -94.47],[mean(data(1:154,5))],'x','MarkerIndices',1,'color','k')
% plot([-94.50 -94.44 -94.44 -94.5 -94.5], [quantile(data(1:154,5),0.25) quantile(data(1:154,5),0.25) quantile(data(1:154,5),0.75) quantile(data(1:154,5),0.75) quantile(data(1:154,5),0.25)], 'linewidth',0.5,'color','k')
% 
% plot([-94.36 -94.36],[mean(data(1:184,9))],'x','MarkerIndices',1, 'color','k')
% plot([-94.44 -94.27 -94.27 -94.44 -94.44], [quantile(data(1:184,9),0.25) quantile(data(1:184,9),0.25) quantile(data(1:184,9),0.75) quantile(data(1:184,9),0.75) quantile(data(1:184,9),0.25)], 'linewidth',0.5,'color','k')
% 
% plot([-94.1 -94.1],[mean(data(1:682,13))],'x','MarkerIndices',1, 'color','k')
% plot([-94.27 -93.90 -93.9 -94.27 -94.27], [quantile(data(1:682,13),0.25) quantile(data(1:682,13),0.25) quantile(data(1:682,13),0.75) quantile(data(1:682,13),0.75) quantile(data(1:682,13),0.25)], 'linewidth',0.5,'color','k')
% 
% plot([-93.86 -93.86],[mean(data(1:175,17))],'x','MarkerIndices',1, 'color','k')
% plot([-93.90 -93.83 -93.83 -93.9 -93.9], [quantile(data(1:175,17),0.25) quantile(data(1:175,17),0.25) quantile(data(1:175,17),0.75) quantile(data(1:175,17),0.75) quantile(data(1:180,17),0.25)], 'linewidth',0.5,'color','k')
% 
% plot([-93.82 -93.82],[mean(data(1:45,21))],'x','MarkerIndices',1, 'color','k')
% plot([-93.83 -93.81 -93.81 -93.83 -93.83], [quantile(data(1:45,21),0.25) quantile(data(1:45,21),0.25) quantile(data(1:45,21),0.75) quantile(data(1:45,21),0.75) quantile(data(1:45,21),0.25)], 'linewidth',0.5,'color','k')
% 
% plot([-93.65 -93.65],[mean(data(1:218,25))],'x','MarkerIndices',1, 'color','k')
% plot([-93.81 -93.5 -93.5 -93.81 -93.81], [quantile(data(1:218,25),0.25) quantile(data(1:218,25),0.25) quantile(data(1:218,25),0.75) quantile(data(1:218,25),0.75) quantile(data(1:218,25),0.25)], 'linewidth',0.5,'color','k')
% 
% 
% %%% plot model
% plot((state.time/1e6),state.d13c_POC_p,'-', 'Color', [0.23 0.53 0.97],'LineWidth', 1)
% % plot((state.time/1e6),state.d13c_POC_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time,state.d13c_POC_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel(['\delta^{13}C C_{org} (',char(8240),')'])
% % xlim([-96 -92])
% title('f')

%%%% Atmospheric O2 (%)
subplot(4,3,7);
hold on;
box on;
plot(((state.time/1e6)),(state.mrO2.*100),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','O2');
xlabel('Time (Ma)');
ylabel({'Atmospheric O_{2}';'(%)'});
% xlim([-96 -92]);
xlim([-100 -90]);
ylim([25 40]);
title('g');
%%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
% 


%%%% total carbonate burial
subplot(4,3,8);
hold on;
box on;
set(gca, 'YScale', 'log')
semilogy((state.time/1e6),state.Fw,'-','Color','k');
xlabel('Time (Ma)');
ylabel({'carbonate burial';'(mol yr^{-1})'});
% xlim([-96 -92]);
xlim([-100 -90]);
ylim([1e13 20e13])
title('j');

% % %% Primary productivity PP
% % subplot(4,3,9);
% % hold on;
% % box on;set(gca, 'YScale', 'log')
% % semilogy((state.time/1e6),state.P_PP_P,'--', 'Color', [0.23 0.53 0.97], 'displayname','proximal');
% % semilogy((state.time/1e6),state.P_PP_S,'-','Color', [0.23 0.53 0.97], 'displayname','surface');
% % semilogy((state.time/1e6),state.P_PP_D,':', 'Color', [0.23 0.53 0.97], 'displayname','distal');
% % xlabel('Time (Ma)');
% % ylabel({'Primary Productivity';'(mol yr^{-1})'});
% % xlim([-96 -92]);
% % ylim([5e13 5e15])
% % title('i');
% % %% Legend
% % l=legend;
% % fontsize(l, 'decrease');
% % set(l,'edgecolor','none');
% % set(l,'location','southeast');

%%%Phos Weathering fluxes
subplot(4,3,9);
hold on;
box on;
set(gca, 'YScale', 'log')
plot((state.time/1e6),state.River_SRP,':', 'Color','k', 'displayname','riverine SRP');
xlabel('Time (Ma)');
ylabel({'Weathering Fluxes';'(mol yr^{-1})'});
% xlim([-100 -90]);
xlim([-96 -92]);
ylim([5e10 5e11])
title('e');
%%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%%% total organic carbon burial
subplot(4,3,10);
hold on;
box on;
set(gca, 'YScale', 'log')
semilogy((state.time/1e6),state.Fmocb,'-','Color','k','DisplayName','total');
semilogy((state.time/1e6),state.POC_P_Burial,':','Color','k','DisplayName','prox');
semilogy((state.time/1e6),state.POC_D_Burial,'-','Color','g','DisplayName','dis');
semilogy((state.time/1e6),state.POC_DP_Burial,':','Color','g','DisplayName','deep');
xlabel('Time (Ma)');
ylabel({'organic carbon burial';'(mol yr^{-1})'});
% xlim([-100 -90]);
xlim([-96 -92]);
ylim([1e12 20e12])
title('j');
%%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

%%% Soluble Reactive P concentration (not normalised, for normalisation
% %%%% include /present day value in it)
% subplot(4,3,11);
% hold on;
% box on;
% plot(((state.time/1e6)),(state.SRP_DP),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','deep');
% plot(((state.time/1e6)),(state.SRP_S),'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1, 'DisplayName','surface');
% plot(((state.time/1e6)),(state.SRP_D),':','Color', [0.23 0.53 0.97], 'DisplayName','distal');
% plot(((state.time/1e6)),(state.SRP_P),'--', 'Color', [0.23 0.53 0.97], 'DisplayName','proximal');
% % plot(((state.time/1e6)),(state.SRP_DP/1.8e18),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','deep');
% % plot(((state.time/1e6)),(state.SRP_S/49830e12),'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1, 'DisplayName','surface');
% % plot(((state.time/1e6)),(state.SRP_D/3600e12),':','Color', [0.23 0.53 0.97], 'DisplayName','distal');
% % plot(((state.time/1e6)),(state.SRP_P/36e12),'--', 'Color', [0.23 0.53 0.97], 'DisplayName','proximal');
% xlabel('Time (Ma)');
% ylabel({'SRP conc';'(mol m^{-3})'});
% xlim([-96 -92])
% title('g');
% %%%% Legend
% l=legend;
% fontsize(l, 'decrease');
% set(l,'edgecolor','none');
% set(l,'location','southeast');

% 
% %%% POP concentration(not normalised, for normalisation
% %%%% include /present day value in it)
% subplot(4,3,12);
% hold on;
% box on;
% plot(((state.time/1e6)),(state.OP_DP),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','deep');
% plot(((state.time/1e6)),(state.OP_S),'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1, 'DisplayName','surface');
% plot(((state.time/1e6)),(state.OP_D),':','Color', [0.23 0.53 0.97], 'DisplayName','distal');
% plot(((state.time/1e6)),(state.OP_P),'--', 'Color', [0.23 0.53 0.97], 'DisplayName','proximal');
% % plot(((state.time/1e6)),(state.OP_DP/1.8e18),'-', 'Color', [0.49 0.18 0.55], 'DisplayName','deep');
% % plot(((state.time/1e6)),(state.OP_S/49830e12),'-', 'Color', [0.23 0.53 0.97], 'LineWidth', 1, 'DisplayName','surface');
% % plot(((state.time/1e6)),(state.OP_D/3600e12),':','Color', [0.23 0.53 0.97], 'DisplayName','distal');
% % plot(((state.time/1e6)),(state.OP_P/36e12),'--', 'Color', [0.23 0.53 0.97], 'DisplayName','proximal');
% xlabel('Time (Ma)');
% ylabel({'POP conc';'(mol m^{-3})'});
% xlim([-96 -92]);
% title('h');
% %%% Legend
% l=legend;
% fontsize(l, 'decrease');
% set(l,'edgecolor','none');
% set(l,'location','southeast');


%%% Nut inputs
subplot(4,3,11);
hold on;
box on;
plot((state.time/1e6), state.add_P_input,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','P');
plot((state.time/1e6),state.add_Pw_input, ':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname' , 'Pw');
xlabel('Time (Ma)');
ylabel({'P input';'(mol yr^{-1})'});
xlim([-100 -90]);
xlim([-96 -92]);
ylim([0 6e10])
title('a');
%%% Legend;
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');




%%%%%%%%% C P ratio
% subplot(4,3,11)
% hold on
% box on
% plot((state.time/1e6),state.CP_Dist,':', 'Color', [0.23 0.53 0.97], 'displayname','distal')
% plot((state.time/1e6),state.CP_Deep,'-', 'Color', [0.49 0.18 0.55], 'LineWidth', 1, 'displayname','deep')
% plot((state.time/1e6),state.CP_Prox,'--', 'Color', [0.23 0.53 0.97],'displayname','proximal')
% xlabel('Time (Ma)')
% ylabel('C:P')
% xlim([-96 -92])
% title('k')


%%%%%%%%% Anoxia
subplot(4,3,12)
hold on
box on
set(gca, 'YScale', 'log')
semilogy((state.time/1e6),state.fanoxicdist*100,':', 'Color', [0.23 0.53 0.97], 'displayname','distal'); %%distal box anoxia in % of floor area
% semilogy((state.time/1e6),state.fanoxicprox*100,'--', 'Color', [0.23 0.53 0.97],'displayname','proximal'); % proximal box anoxia in % of floor area
% semilogy((state.time/1e6),state.fanoxicdist,':', 'Color', [0.23 0.53 0.97], 'displayname','distal')
% semilogy((state.time/1e6),state.fanoxicprox,'--', 'Color', [0.23 0.53 0.97],'displayname','proximal')
xlabel('Time (Ma)')
ylabel('fanoxia')
% xlim([-100 -90]);
xlim([-96 -92])
ylim([0 1])
title('l')


% %%%%% make figure 2
% figure('Color',[1 0.98 0.95]);
% title('Fig. 2');
% %%% define colours
% plot(state.time, state.D)


%%% plotting script finished
fprintf('Done: ')
endtime = toc ;
fprintf('time (s): %d \n', endtime )


