function [xy_data] = SRev_Data_Ellipse(a, b, deg1, deg2, varargin)
%Extr_Data_Ring Produce extrusion data for a ring.
%   [xy_data] = Extr_Data_Ring(ring_or, ring_ir, deg1, deg2)
%   This function returns x-y data for a ring.  
%   You can specify:
%       Outer radius	ring_or
%       Inner radius	ring_ir
%       Start angle     deg1
%       Finish angle	deg2
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_Ring
%
%   To see a plot created with your parameter values, 
%   add 'plot' as the final argument
%   >> Extr_Data_Ring(10,5,45,315,'plot')

% Copyright 2012-2025 The MathWorks, Inc.

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    deg1 = 45;
    deg2 = 315;
    ring_or = 10;
    ring_ir = 5;
end

% CHECK IF PLOT SHOULD BE PRODUCED
if (isempty(varargin))
    showplot = 'n';
else
    showplot = varargin;
end

% CALCULATE SOLID OF REVOLUTION DATA
xdata = a:-a/20:0;
for i=1:length(xdata)
	ydata(i) = b/a*sqrt(a^2-xdata(i)^2);
end
xy_data = [xdata; ydata]';

%{
unit_circle = [cos(theta), sin(theta)];
if(ring_ir>0)
    xy_data = [ring_or * unit_circle; ring_ir * flipud(unit_circle)];
else
    xy_data = [ring_or * unit_circle];
end
%}
% PLOT DIAGRAM TO SHOW PARAMETERS AND EXTRUSION
if (nargin == 0 || strcmpi(showplot,'plot'))
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('square');
    axis([-1.1 1.1 -1.1 1.1]*ring_or);
    
    % SHOW PARAMETERS
    hold on
    
    ir_label_ang = deg1+deg2*0.2;
    or_label_ang = deg1+deg2*0.5;
    plot([0 ring_or*(cos(or_label_ang*pi/180))],[0 ring_or*(sin(or_label_ang*pi/180))],'r-d','MarkerFaceColor','r');
    text(cos(or_label_ang*pi/180)*0.75*ring_or,sin(or_label_ang*pi/180)*0.75*ring_or,'{\color{red}ring\_or}');
    
    plot([0 ring_ir*(cos(ir_label_ang*pi/180))],[0 ring_ir*(sin(ir_label_ang*pi/180))],'g-d','MarkerFaceColor','g');
    text(cos(ir_label_ang*pi/180)*0.5*ring_ir,sin(ir_label_ang*pi/180)*0.5*ring_ir,'{\color{green}ring\_ir}');
    
    plot([0 ring_or],[0 0],'k:');
    plot([0 ring_ir*cos(deg1*pi/180)],[0 ring_ir*sin(deg1*pi/180)],'k:');
    plot([0 ring_ir*cos(deg2*pi/180)],[0 ring_ir*sin(deg2*pi/180)],'k:');    

    arc1_r = 0.75*ring_ir;
    arc1 = [(0:1:deg1)]'*pi/180;
    plot(cos(arc1)*arc1_r,sin(arc1)*arc1_r,'k-');
    plot(cos(arc1(1))*arc1_r,sin(arc1(1))*arc1_r,'kd','MarkerFaceColor','k');
    plot(cos(arc1(end))*arc1_r,sin(arc1(end))*arc1_r,'kd','MarkerFaceColor','k');
    text(cos(deg1/2*pi/180)*arc1_r*1.1,sin(deg1/2*pi/180)*arc1_r*1.1,'deg1');

    arc2_r = 0.25*ring_ir;
    arc2 = [(0:1:deg2)]'*pi/180;
    plot(cos(arc2)*arc2_r,sin(arc2)*arc2_r,'k-');
    plot(cos(arc2(1))*arc2_r,sin(arc2(1))*arc2_r,'kd','MarkerFaceColor','k');
    plot(cos(arc2(end))*arc2_r,sin(arc2(end))*arc2_r,'kd','MarkerFaceColor','k');
    text(cos(0.7*deg2*pi/180)*arc2_r*2,sin(0.7*deg2*pi/180)*arc2_r*2,'deg2');
    title(['[xy\_data] = Extr\_Data\_Ring(ring\_or, ring\_ir, deg1, deg2);']);
    hold off
    clear xy_data
end
