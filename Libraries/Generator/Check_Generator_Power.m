% Copyright 2009-2020 The MathWorks(TM), Inc.
load Generator_Speed_Tests

colordef black;
figure(1);
clf;
set(gcf,'Position',[765   405   449   336]);

plot(Generator_Final_Speed_RPM,Generator_Final_Power/1e6,'color','y','LineWidth',3)
title_h = title('Generator Power (MW) vs Generator Speed (RPM)');
xlabel_h = xlabel('Generator Speed (RPM)');
ylabel_h = ylabel('Generator Power (MW)');

set(title_h,'FontSize',14);
set(xlabel_h,'FontSize',12);
set(ylabel_h,'FontSize',12);

grid on
set(gca,'Box','on');

axis([1160 1240 -2.75 2.75])
colordef white
