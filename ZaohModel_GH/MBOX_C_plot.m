% 
%%% plot model fluxes MBOX
global state
global stepnumber
global pars
global workingstate

%%% output to screen
fprintf('running plotting script... \t')
tic


%%%%% make figure
figure('Color',[1 0.98 0.95])
title('Fig. 1')
%%% define colours

% %%%% Atmos CO2 in ppm
% 
%%%% inputs
subplot(5,4,1)
hold on
box on
plot(state.time_myr,state.CO2_input,'--', 'Color', [0.23 0.53 0.97], 'displayname','CO_{2}')
plot(state.time_myr,state.add_Fe_input, 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname' , 'Fe')
xlabel('Time (Ma)')
ylabel({'input';'(mol a^{-1})'})
xlim([-96 -92])
title('a')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
% 


subplot(5,4,2)
hold on
box on
xlabel('Time (Ma)')
ylabel({'Atmospheric CO_{2}';'(ppm)'})
plot(state.time_myr,state.Atmospheric_CO2_ppm,'k')
xlim([-96 -92])
title('b')

%%% Atmos O2 im mol m^-3
subplot(5,4,3)
hold on
box on
xlabel('Time (Ma)')
ylabel({'Atmospheric O_{2}';'(mol)'})
plot(state.time_myr,state.O2_a,'k')
plot(state.time_myr,state.mrO2.*100,'k')
xlim([-96 -92])
title('c')

%%% Ocean O2 concentration in mol m^-3
subplot(5,4,4)
hold on
box on
plot(state.time_myr,state.O2_conc_p,'--', 'Color', [0.23 0.53 0.97], 'DisplayName','proximal')
plot(state.time_myr,state.O2_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'DisplayName','distal')
plot(state.time_myr,state.O2_conc_s,'-','Color', [0.23 0.53 0.97], 'DisplayName','surface')
plot(state.time_myr,state.O2_conc_h,'-', 'Color', [0.03 0.06 0.47], 'DisplayName','high-lat.')
plot(state.time_myr,state.O2_conc_d,'-', 'Color', [0.48 0.18 0.55],'LineWidth', 1, 'DisplayName','deep')
xlabel('Time (Ma)')
ylabel({'Oceanic O_{2}';'(mol)'})
xlim([-96 -92])
title('d')
%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%% Ocean DIC concentration mol m^-3
subplot(5,4,5)
hold on
box on
plot(state.time_myr,state.DIC_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.DIC_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.DIC_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.DIC_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.DIC_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'DIC';'(mol m^{-3})'})
xlim([-96 -92])
title('e')

%%% Ocean POC concentration
subplot(5,4,6)
hold on
box on
plot(state.time_myr,state.POC_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.POC_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.POC_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.POC_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.POC_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'POC';'(mol m^{-3})'})
xlim([-96 -92])
title('f')


%% Temperature in C
subplot(5,4,7)
hold on
box on
plot(state.time_myr,state.T_p-273.15,'--', 'Color', [0.23 0.53 0.97], 'displayname' ,'prox - dis - surf')
plot(state.time_myr,state.GAST-273.15,':', 'Color', [0.23 0.53 0.97], 'displayname' ,'GAST')
plot(state.time_myr,state.T_h-273.15,'-', 'Color', [0.03 0.06 0.47], 'displayname', 'high-lat. - deep')
xlabel('Time (Ma)')
ylabel('Temperature (^{o}C)')
xlim([-96 -92])
%%% Legend
l=legend;
fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');
title('g')


%%% Alkalinity in mol
subplot(5,4,8)
hold on
box on
plot(state.time_myr,state.ALK_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.ALK_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.ALK_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.ALK_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.ALK_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'Alkalinity';'(meq kg{-1})'})
xlim([-96 -92])
title('h')


%%% pH
subplot(5,4,9)
hold on
box on
plot(state.time_myr,state.pH_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.pH_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.pH_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.pH_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.pH_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel('pH')
xlim([-96 -92])
title('i')

%%% carbon isotopes atmosphere
subplot(5,4,10)
hold on
box on
plot(state.time_myr,state.d13c_atm, 'k')
xlabel('Time (Ma)')
ylabel(['atmo. \delta^{13}C (',char(8240),')'])
xlim([-96 -92])
title('j')



%%%% carbon isotopes DIC %%% 
subplot(5,4,11)
hold on
box on
% plot model
plot(state.time_myr,state.d13c_DIC_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.d13c_DIC_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.d13c_DIC_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.d13c_DIC_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.d13c_DIC_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel(['\delta^{13}C of DIC (',char(8240),')'])
xlim([-96 -92])
title('k')

%%%% carbon isotopes POC %%% changed the excel sheet, code needs adjusting
subplot(5,4,12)
hold on
box on
%%% plot model
plot(state.time_myr,state.d13c_POC_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.d13c_POC_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.d13c_POC_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.d13c_POC_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.d13c_POC_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel(['\delta^{13}C of POC (',char(8240),')'])
xlim([-96 -92])
title('l')

%%%% dissolved P concentration
subplot(5,4,13)
hold on
box on
plot(state.time_myr,state.DP_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.DP_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.DP_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.DP_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.DP_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'dissolved P';'(mol m^{-3})'})
xlim([-96 -92])
title('m')

%%%% dissolved Fe(III) concentration
subplot(5,4,14)
hold on
box on
plot(state.time_myr,state.FeIII_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.FeIII_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.FeIII_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.FeIII_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.FeIII_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'dissolved Fe(III)';'(mol m^{-3})'})
xlim([-96 -92])
title('n')

%%%% dissolved Fe(II) concentration
subplot(5,4,15)
hold on
box on
plot(state.time_myr,state.FeII_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.FeII_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.FeII_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.FeII_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.FeII_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'dissolved Fe(II)';'(mol m^{-3})'})
xlim([-96 -92])
title('o')


%%%% dissolved sulfate concentration
subplot(5,4,16)
hold on
box on
plot(state.time_myr,state.SO4_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.SO4_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.SO4_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.SO4_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.SO4_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'SO_{4}^{2-}';'(mol m^{-3})'})
xlim([-96 -92])
title('p')

%%%% dissolved sulfide concentration
subplot(5,4,17)
hold on
box on
plot(state.time_myr,state.H2S_conc_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.H2S_conc_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.H2S_conc_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.H2S_conc_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.H2S_conc_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'H_{2}S';'(mol m^{-3})'})
xlim([-96 -92])
title('q')


%%%% HCO3
subplot(5,4,18)
hold on
box on
plot(state.time_myr,state.HCO3_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.HCO3_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state. HCO3_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state. HCO3_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state. HCO3_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'HCO_{3}^{-}';'(mol kg^{-1})'})
xlim([-96 -92])
title('q')

%%%% Carbonate species CO3
subplot(5,4,19)
hold on
box on
plot(state.time_myr,state.CO3_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.CO3_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.CO3_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state. CO3_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state. CO3_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'CO_{3}^{2-}';'(mol kg^{-1})'})
xlim([-96 -92])
title('r')

%%%% Carbonate species H+
subplot(5,4,20)
hold on
box on
plot(state.time_myr,state.H_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.H_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.H_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.H_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.H_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'H^{+}';'(mol kg^{-1})'})
xlim([-96 -92])
title('s')



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%  Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% make figure
figure('Color',[1 0.98 0.95])
title('Fig. 2')


%%%% Primary productivity
subplot(4,4,1)
hold on
box on
plot(state.time_myr,state.pripr_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.pripr_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.pripr_h,'-', 'Color', [0.03 0.06 0.47])
xlabel('Time (Ma)')
ylabel({'Primary Productivity';'(mol yr^{-1})'})
xlim([-96 -92])
title('a')


%%%% Aerobic Respiration
subplot(4,4,2)
hold on
box on
plot(state.time_myr,state.AR_p,'--', 'Color', [0.23 0.53 0.97], 'displayname','proximal')
plot(state.time_myr,state.AR_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname','distal')
plot(state.time_myr,state.AR_s,'-','Color', [0.23 0.53 0.97], 'displayname','surface')
plot(state.time_myr,state.AR_h,'-', 'Color', [0.03 0.06 0.47], 'displayname','high-lat.')
plot(state.time_myr,state.AR_d,'-', 'Color', [0.49 0.18 0.55], 'displayname','deep','LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'Aerobic Respiration';'(mol yr^{-1})'})
xlim([-96 -92])
title('b')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%%% Iron Reduction
subplot(4,4,3)
hold on
box on
plot(state.time_myr,state.ironR_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.ironR_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.ironR_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.ironR_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.ironR_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'Fe Reduction';'(mol yr^{-1})'})
xlim([-96 -92])
title('c')


%%%% Sulfate Reduction
subplot(4,4,4)
hold on
box on
plot(state.time_myr,state.sulfR_p,'--', 'Color', [0.23 0.53 0.97])
plot(state.time_myr,state.sulfR_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
plot(state.time_myr,state.sulfR_s,'-','Color', [0.23 0.53 0.97])
plot(state.time_myr,state.sulfR_h,'-', 'Color', [0.03 0.06 0.47])
plot(state.time_myr,state.sulfR_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
xlabel('Time (Ma)')
ylabel({'SO_{4}^{2-} Reduction';'(mol yr^{-1})'})
xlim([-96 -92])
title('d')


%%% Weathering fluxes sil, gran, bas, carb, oxid
subplot(4,4,5)
hold on
box on
semilogy(state.time_myr,state.silw,'--', 'Color', [0.59 0.41 0.25], 'displayname','sil')
% plot(state.time_myr,state.carbw,':', 'Color', [0.59 0.41 0.25], 'LineWidth', 2, 'displayname','carb')
% plot(state.time_myr,state.oxidw,'-', 'Color', [0.59 0.41 0.25], 'displayname','oxid')
% plot(state.time_myr,state.granw,'-', 'Color', [0.03 0.06 0.47], 'displayname','gran')
% plot(state.time_myr,state.basw,':', 'Color', [0.49 0.18 0.55], 'LineWidth', 2, 'displayname','bas')
% xlabel('Time (Ma)')
ylabel({'Weathering Fluxes';'(mol yr^{-1})'})
xlim([-96 -92])
title('e')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


%%% Weathering fluxes pyrite, sulfate, Fe(III)
subplot(4,4,6)
hold on
box on
set(gca, 'YScale', 'log')
% plot(state.time_myr,state.pyritew,'--', 'Color', [0.59 0.41 0.25], 'displayname','Pyrite')
semilogy(state.time_myr,state.phosw,':', 'Color', [0.59 0.41 0.25], 'LineWidth', 2, 'displayname','P')
semilogy(state.time_myr,state.FeIIIw,'-', 'Color', [0.59 0.41 0.25], 'displayname','Fe(III)')
xlabel('Time (Ma)')
ylabel({'Nut Weathering Fluxes';'(mol yr^{-1})'})
xlim([-96 -92])
title('f')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

% 
%%%% Burial carbonates
subplot(4,4,7)
hold on
box on
set(gca, 'YScale', 'log')
semilogy(state.time_myr,state.mccb_p,'--', 'Color', [0.23 0.53 0.97], 'displayname','proximal')
semilogy(state.time_myr,state.mccb_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname','distal')
semilogy(state.time_myr,state.mccb_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1, 'displayname','deep')
xlabel('Time (Ma)')
ylabel({'Burial Carbonates';'(mol C yr^{-1})'})
xlim([-96 -92])
title('g')
% 
% 
%%%% Burial organic carbon
subplot(4,4,8)
hold on
box on
set(gca, 'YScale', 'log')
semilogy(state.time_myr,state.total_mocb,'-', 'Color', [0.23 0.53 0.97], 'displayname','total')
semilogy(state.time_myr,state.mocb_p,'--', 'Color', [0.23 0.53 0.97], 'displayname','proximal')
semilogy(state.time_myr,state.mocb_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname','distal')
semilogy(state.time_myr,state.mocb_d,'-', 'Color', [0.49 0.18 0.55], 'displayname','deep','LineWidth', 1)
% plot(state.time_myr,state.locb,'-', 'Color', [0.59 0.41 0.25], 'displayname','land')
xlabel('Time (Ma)')
ylabel({'Burial Organic Carbon';'(mol C yr^{-1})'})
xlim([-96 -92])
title('h')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');


% %%% Benthic fluxes DIC
% subplot(4,4,9)
% hold on
% box on
% plot(state.time_myr,state.DICbenthic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.DICbenthic_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.DICbenthic_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Benthic Fluxes';'DIC (mol C yr^{-1})'})
% xlim([-96 -92])
% title('i')
% 
% 
% %%% Benthic fluxes Oxygen
% subplot(4,4,10)
% hold on
% box on
% plot(state.time_myr,state.oxygenbentic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.oxygenbentic_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.oxygenbentic_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Benthic Flux';'O_{2} (mol yr^{-1})'})
% xlim([-96 -92])
% title('j')
% 
% 
% %%% Benthic fluxes Sulfate
% subplot(4,4,11)
% hold on
% box on
% plot(state.time_myr,state.sulfatebentic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.sulfatebentic_di,':', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.sulfatebentic_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Benthic Flux';'SO_4^{2-} (mol yr^{-1})'})
% xlim([-96 -92])
% title('k')
% 
% %%% Benthic fluxes Fe(II)
% subplot(4,4,12)
% hold on
% box on
% plot(state.time_myr,state.FeIIbenthic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.FeIIbenthic_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.FeIIbenthic_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Benthic Flux';'Fe(II) (mol yr^{-1})'})
% xlim([-96 -92])
% title('l')
% 
% 
% %%% Benthic fluxes phosphorus
% subplot(4,4,13)
% hold on
% box on
% plot(state.time_myr,state.phosbenthic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.phosbenthic_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.phosbenthic_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Benthic Flux';'P (mol yr^{-1})'})
% xlim([-96 -92])
% title('m')
% 
% 
% %%%% Fe(III) scavenging
% subplot(4,4,14)
% hold on
% box on
% plot(state.time_myr,state.FeIIIscavenging_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.FeIIIscavenging_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.FeIIIscavenging_s,'-','Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.FeIIIscavenging_h,'-', 'Color', [0.03 0.06 0.47])
% plot(state.time_myr,state.FeIIIscavenging_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Fe(III) scavenging';'(mol yr^{-1})'})
% xlim([-96 -92])
% title('n')
% 
% 
% %%% Methanogenesis
% subplot(4,4,15)
% hold on
% box on
% plot(state.time_myr,state.methanogenesis_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.methanogenesis_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.methanogenesis_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({'Methanogenesis';'(mol yr^{-1})'})
% xlim([-96 -92])
% title('o')
% 
% 
% %%%% Pyrite formation water column 
% subplot(4,4,16)
% hold on
% box on
% plot(state.time_myr,state.pyF_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.pyF_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.pyF_s,'-','Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.pyF_h,'-', 'Color', [0.03 0.06 0.47])
% plot(state.time_myr,state.pyF_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% xlabel('Time (Ma)')
% ylabel({' Water Colume Pyrite'; 'Form. (mol yr^{-1})'})
% xlim([-96 -92])
% title('p')
% 
% 
% 
% 
% 
% %%%%Pyrite formation sediment – not defined in the script  
% %subplot(4,4,16)
% %hold on
% %box on
% %plot(state.time_myr,state.pyF_p,'--', 'Color', [0.23 0.53 0.97])
% %plot(state.time_myr,state.pyF_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% %plot(state.time_myr,state.pyF_s,'-','Color', [0.23 0.53 0.97])
% %plot(state.time_myr,state.pyF_h,'-', 'Color', [0.03 0.06 0.47])
% %plot(state.time_myr,state.pyF_d,'-', 'Color', [0.49 0.18 0.55],'LineWidth', 1)
% %xlabel('Time (Ma)')
% %ylabel({'Sedimantery Pyrite';'Form. (mol yr^{-1})'})
% %title('p')
% 
% 
% 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%  Figure 3 Phosphorus stuff %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Color',[1 0.98 0.95])
title('Fig. 3')

%%%% DOA 
subplot(2,3,1)
hold on
box on
set(gca, 'YScale', 'log')
% semilogy(state.time_myr,state.DOA_p*100,'--', 'Color', [0.23 0.53 0.97], 'displayname', 'proximal')
semilogy(state.time_myr,state.DOA_di*100,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2, 'displayname', 'distal') % distal box anoxia in % of floor area
% plot(state.time_myr,state.DOA_d*100,'-', 'Color', [0.49 0.18 0.55],'displayname', 'deep')
xlabel('Time (Ma)')
ylabel('DOA')
xlim([-96 -92])
ylim([0 1])
title('a')
%%%% Legend
l=legend;
% fontsize(l, 'decrease');
set(l,'edgecolor','none');
set(l,'location','southeast');

% Benthic fluxes phosphorus
% subplot(2,3,2)
% hold on
% box on
% plot(state.time_myr,state.phosbenthic_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.phosbenthic_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.phosbenthic_d,'-', 'Color', [0.49 0.18 0.55])
% xlabel('Time (Ma)')
% ylabel({'Benthic Flux';'P (mol yr^{-1})'})
% xlim([-96 -92])
% title('b')
% 
% %%%%%%% C P ratio
% subplot(2,3,3)
% hold on
% box on
% plot(state.time_myr,state.CPratio_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.CPratio_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.CPratio_d,'-', 'Color', [0.49 0.18 0.55])
% xlabel('Time (Ma)')
% ylabel('C:P')
% xlim([-96 -92])
% title('c')
% 
% 
% %%%%%%% POP burial
% subplot(2,3,4)
% hold on
% box on
% plot(state.time_myr,state.POPburial_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.POPburial_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.POPburial_d,'-', 'Color', [0.49 0.18 0.55])
% xlabel('Time (Ma)')
% ylabel({'POP burial'; '(mol yr^{-1})'})
% xlim([-96 -92])
% title('d')
% 
% %%%%%%% PFe
% subplot(2,3,5)
% hold on
% box on
% plot(state.time_myr,state.PFe_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.PFe_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.PFe_d,'-', 'Color', [0.49 0.18 0.55])
% xlabel('Time (Ma)')
% ylabel({'P_{Fe}'; '(mol yr^{-1})'})
% xlim([-96 -92])
% title('e')
% 
% %%%%%%% Pauth 
% subplot(2,3,6)
% hold on
% box on
% plot(state.time_myr,state.Pauth_p,'--', 'Color', [0.23 0.53 0.97])
% plot(state.time_myr,state.Pauth_di,':', 'Color', [0.23 0.53 0.97], 'LineWidth', 2)
% plot(state.time_myr,state.Pauth_d,'-', 'Color', [0.49 0.18 0.55])
% xlabel('Time (Ma)')
% ylabel({'P_{auth}'; '(mol yr^{-1})'})
% xlim([-96 -92])
% title('f')
% 

%% plotting script finished
fprintf('Done: ')
endtime = toc ;
fprintf('time (s): %d \n', endtime )



% pyriteb_p – sedimentary pyrite formation not defined in the script.

