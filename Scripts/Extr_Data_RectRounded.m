function [xy_data] = Extr_Data_RectRounded(height, width, radius, varargin)
%Extr_Data_RectRounded Produce extrusion data for a rectangle with rounded corners.
%   [xy_data] = Extr_Data_RectRounded(height, width, radius, varargin)
%   This function returns x-y data for a rectangle with rounded corners.  
%   You can specify:
%       Height          height
%       Width           width
%       Corner radius   radius
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_RectRounded
%
%   To see a plot created with your parameter values, 
%   add 'plot' as the final argument
%   >> Extr_Data_RectRounded(6,4,1,'plot')

% Copyright 2012-2015 The MathWorks, Inc.

% DEFAULT DATA TO SHOW DIAGRAM
if (nargin == 0)
    height = 6;
    width = 4;
    radius = 1;
end

% CHECK IF PLOT SHOULD BE PRODUCED
if (isempty(varargin))
    showplot = 'n';
else
    showplot = varargin;
end

% CALCULATE QUARTER ELLIPSE
xyset1 = [width/2-radius height/2;-width/2+radius height/2];
xyset2 = [Extr_Data_Ring(radius,0,91,179)];
xyset2(:,1) = xyset2(:,1)+(-width/2+radius);
xyset2(:,2) = xyset2(:,2)+(height/2-radius);
xyset3 = [-width/2 -radius+height/2;-width/2 -height/2+radius];
xyset4 = [Extr_Data_Ring(radius,0,181,269)];
xyset4(:,1) = xyset4(:,1)+(-width/2+radius);
xyset4(:,2) = xyset4(:,2)+(-height/2+radius);
xyset5 = [-width/2+radius -height/2;width/2-radius -height/2];
xyset6 = [Extr_Data_Ring(radius,0,271,359)];
xyset6(:,1) = xyset6(:,1)+(width/2-radius);
xyset6(:,2) = xyset6(:,2)+(-height/2+radius);
xyset7 = [width/2 -height/2+radius;width/2 height/2-radius];
xyset8 = [Extr_Data_Ring(radius,0,1,89)];
xyset8(:,1) = xyset8(:,1)+(width/2-radius);
xyset8(:,2) = xyset8(:,2)+(height/2-radius);

xy_data = [xyset1; xyset2; xyset3; xyset4; xyset5; xyset6; xyset7; xyset8];

% PLOT DIAGRAM TO SHOW PARAMETERS AND EXTRUSION
if (nargin == 0 || strcmpi(showplot,'plot'))
    % PLOT EXTRUSION
    plot(xy_data(:,1),xy_data(:,2),'b-o','LineWidth',1.5);
    axis('square');
    axis([-1.1 1.1 -1.1 1.1]*max(height/2,width/2));
    
    % SHOW PARAMETERS
    hold on
    
    plot([0 0],[-height/2 height/2],'r-d','MarkerFaceColor','r');
    text(0,height/2*0.5,'{\color{red}height}');

    plot([-width/2 width/2],[0 0],'g-d','MarkerFaceColor','g');
    text(width/2*0.5,height*0.01,'{\color{green}width}');

    radius_label_angle = 45*(pi/180);
    plot([width/2-radius width/2-radius*(1-cos(radius_label_angle))],[height/2-radius height/2-radius*(1-sin(radius_label_angle))],'k-d','MarkerFaceColor','k');
    text(width/2-radius/2*(cos(radius_label_angle)),height/2-radius/2*(sin(radius_label_angle)),'{\color{black}radius}','HorizontalAlignment','center');
    [width/2-radius/2*(cos(radius_label_angle)),height/2-radius/2*(sin(radius_label_angle))]
    title(['[xy\_data] = Extr\_Data\_RectRounded(width, height, radius);']);
    hold off
    clear xy_data
end
