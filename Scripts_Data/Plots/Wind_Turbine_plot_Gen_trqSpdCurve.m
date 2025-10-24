load WT_IndMchData.mat

figure;
plot(WT_IndMchData.spd{1,:}*9.55,-WT_IndMchData.pwr{2,:}*100/1e6,...
    'LineWidth',3);
set(gca,'XLim',[1160 1240]);

grid on
xlabel('Generator Speed (RPM)','FontSize',14)
ylabel('Generator Power (MW)','FontSize',14)
title('Generator Power vs. Speed','FontSize',18)
