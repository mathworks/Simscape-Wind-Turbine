function [xy_data] = Extr_Data_BoxFillet(box_ox, box_oy, rad_o, varargin)
%Extr_Data_BoxFillet Produce extrusion data for a rectangle with rounded corners.
%   [xy_data] = Extr_Data_BoxFillet(height, width, radius, varargin)
%   This function returns x-y data for a rectangle with rounded corners.
%   You can specify:
%       Outer width             box_ox
%       Outer height            box_oy
%       Radius, outer fillet    rad_o
%       Inner width             box_ix
%       Inner height            box_iy
%       Radius, inner fillet    rad_i
%
%   To see a plot showing parameter values, enter the name
%   of the function with no arguments
%   >> Extr_Data_BoxFillet
%
%   To see a plot created with your parameter values,
%   add 'plot' as the final argument
%   >> Extr_Data_BoxFillet(6,4,1,2,4,0,5,'plot')

% Copyright 2012-2024 The MathWorks, Inc.

% Default data to show diagram
if (nargin == 0)
    box_oy = 6;
    box_ox = 4;
    rad_o = 1;
    box_ix = 2;
    box_iy = 4;
    rad_i = 0.5;
end

if (nargin == 3 || nargin == 4)
    box_ix = 0;
    box_iy = 0;
    rad_i = 0;
end

if (nargin >= 6)
    box_ix  = varargin{1};
    box_iy = varargin{2};
    rad_i = varargin{3};
end

if (nargin == 4 || nargin == 7)
    showplot = varargin{end};
else
    showplot = 'n';
end

% Check if plot should be produced
if (isempty(varargin))
    showplot = 'n';
end

% Create outer profile
if (rad_o>0)
    xyset1 = [box_ox/2-rad_o box_oy/2;-box_ox/2+rad_o box_oy/2];
    xyset3 = [-box_ox/2 -rad_o+box_oy/2;-box_ox/2 -box_oy/2+rad_o];
    xyset5 = [-box_ox/2+rad_o -box_oy/2;box_ox/2-rad_o -box_oy/2];
    xyset7 = [box_ox/2 -box_oy/2+rad_o;box_ox/2 box_oy/2-rad_o];
    
    xyset2 = [Extr_Data_Ring(rad_o,0,91,179)];
    xyset2(:,1) = xyset2(:,1)+(-box_ox/2+rad_o);
    xyset2(:,2) = xyset2(:,2)+(box_oy/2-rad_o);
    xyset4 = [Extr_Data_Ring(rad_o,0,181,269)];
    xyset4(:,1) = xyset4(:,1)+(-box_ox/2+rad_o);
    xyset4(:,2) = xyset4(:,2)+(-box_oy/2+rad_o);
    xyset6 = [Extr_Data_Ring(rad_o,0,271,359)];
    xyset6(:,1) = xyset6(:,1)+(box_ox/2-rad_o);
    xyset6(:,2) = xyset6(:,2)+(-box_oy/2+rad_o);
    xyset8 = [Extr_Data_Ring(rad_o,0,1,89)];
    xyset8(:,1) = xyset8(:,1)+(box_ox/2-rad_o);
    xyset8(:,2) = xyset8(:,2)+(box_oy/2-rad_o);
    xy_data = [xyset1; xyset2; xyset3; xyset4; xyset5; xyset6; xyset7; xyset8];
else
    xyset1 = [box_ox/2 box_oy/2];
    xyset3 = [-box_ox/2 box_oy/2];
    xyset5 = [-box_ox/2 -box_oy/2];
    xyset7 = [box_ox/2 -box_oy/2];
    xy_data = [xyset1; xyset3; xyset5; xyset7];
end


% Create inner profile
if (box_ix>0 &&  box_iy>0)
    xy_data = [xy_data; xy_data(1,:)];
    if(rad_i>0)
        xyset1 = [box_ix/2-rad_i box_iy/2;-box_ix/2+rad_i box_iy/2];
        xyset3 = [-box_ix/2 -rad_i+box_iy/2;-box_ix/2 -box_iy/2+rad_i];
        xyset5 = [-box_ix/2+rad_i -box_iy/2;box_ix/2-rad_i -box_iy/2];
        xyset7 = [box_ix/2 -box_iy/2+rad_i;box_ix/2 box_iy/2-rad_i];
        
        xyset2 = [Extr_Data_Ring(rad_i,0,91,179)];
        xyset2(:,1) = xyset2(:,1)+(-box_ix/2+rad_i);
        xyset2(:,2) = xyset2(:,2)+(box_iy/2-rad_i);
        xyset4 = [Extr_Data_Ring(rad_i,0,181,269)];
        xyset4(:,1) = xyset4(:,1)+(-box_ix/2+rad_i);
        xyset4(:,2) = xyset4(:,2)+(-box_iy/2+rad_i);
        xyset6 = [Extr_Data_Ring(rad_i,0,271,359)];
        xyset6(:,1) = xyset6(:,1)+(box_ix/2-rad_i);
        xyset6(:,2) = xyset6(:,2)+(-box_iy/2+rad_i);
        xyset8 = [Extr_Data_Ring(rad_i,0,1,89)];
        xyset8(:,1) = xyset8(:,1)+(box_ix/2-rad_i);
        xyset8(:,2) = xyset8(:,2)+(box_iy/2-rad_i);
        xy_data_in = [xyset1; xyset2; xyset3; xyset4; xyset5; xyset6; xyset7; xyset8; xyset1(1,:)];
    else
        xyset1 = [box_ix/2 box_iy/2];
        xyset3 = [-box_ix/2 box_iy/2];
        xyset5 = [-box_ix/2 -box_iy/2];
        xyset7 = [box_ix/2 -box_iy/2];
        xy_data_in = [xyset1; xyset3; xyset5; xyset7;xyset1];
    end
    
    xy_data = [xy_data;flipud(xy_data_in)];
end

% Plot diagram to show parameters and extrusion
if (nargin == 0 || strcmpi(showplot,'plot'))
    
    % Figure name
    figString = ['h1_' mfilename];
    % Only create a figure if no figure exists
    figExist = 0;
    fig_hExist = evalin('base',['exist(''' figString ''')']);
    if (fig_hExist)
        figExist = evalin('base',['ishandle(' figString ') && strcmp(get(' figString ', ''type''), ''figure'')']);
    end
    if ~figExist
        fig_h = figure('Name',figString);
        assignin('base',figString,fig_h);
    else
        fig_h = evalin('base',figString);
    end
    figure(fig_h)
    clf(fig_h)
    
    % Plot extrusion
    patch(xy_data(:,1),xy_data(:,2),[1 1 1]*0.90,'EdgeColor','none');
    hold on
    plot(xy_data(:,1),xy_data(:,2),'-','Marker','o','MarkerSize',4,'LineWidth',2);
    axis('equal');
    axis([-1.1 1.1 -1.1 1.1]*max(box_oy/2,box_ox/2));
    
    % Show parameters
    hold on
    
    plot([0 0],[-box_oy/2 box_oy/2],'r-d','MarkerFaceColor','r');
    text(0,-box_oy/2*0.5,'{\color{red}box\_oy}','HorizontalAlignment','right');
    
    plot([-box_ox/2 box_ox/2],[0 0],'g-d','MarkerFaceColor','g');
    text(box_ox/2*0.25,box_oy*0.025,'{\color{green}box\_ox}');
    
    radius_label_angle = 45*(pi/180);
    plot([box_ox/2-rad_o box_ox/2-rad_o*(1-cos(radius_label_angle))],[box_oy/2-rad_o box_oy/2-rad_o*(1-sin(radius_label_angle))],'k-d','MarkerFaceColor','k');
    text(box_ox/2-rad_o/2*(cos(radius_label_angle))*0.0,box_oy/2-rad_o/2*(sin(radius_label_angle))*0.0,'{\color{black}rad\_o}','HorizontalAlignment','center');
    [box_ox/2-rad_o/2*(cos(radius_label_angle)),box_oy/2-rad_o/2*(sin(radius_label_angle))];
    
    if(box_ix > 0 && box_iy > 0)
        plot([1 1]*box_ix*0.25,[-box_iy/2 box_iy/2],'b-d','MarkerFaceColor','b');
        text(box_ix*0.25,-box_iy/2*0.5,'{\color{blue}box\_iy}');
        
        plot([-box_ix/2 box_ix/2],[1 1]*box_iy*0.25,'c-d','MarkerFaceColor','c');
        text(-box_ix/2,box_iy*0.22,'{\color{cyan}box\_ix}');
    end
    
    if (rad_i>0)
        radius_label_angle = 45*(pi/180);
        plot([-box_ix/2+rad_i -box_ix/2+rad_i*(1-cos(radius_label_angle))],[box_iy/2-rad_i box_iy/2-rad_i*(1-sin(radius_label_angle))],'k-d','MarkerFaceColor','k');
        text(-box_ix/2+rad_i/2*(cos(radius_label_angle))*0.0,box_iy/2-rad_i/2*(sin(radius_label_angle))*0.0,'{\color{black}rad\_i}','HorizontalAlignment','center');
        [-box_ix/2+rad_i/2*(cos(radius_label_angle)),box_iy/2-rad_i/2*(sin(radius_label_angle))];
    end
    
    title(['[xy\_data] = Extr\_Data\_BoxFillet(box\_ox, box\_oy, rad\_o,<box\_ix, box\_iy, rad\_i>);']);
    hold off
    box on
    clear xy_data
end
