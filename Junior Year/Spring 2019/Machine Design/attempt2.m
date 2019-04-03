clear all; close all;

%% For Loops for Calling Functions
theta = (0:1:360).*(pi/180);
for i= 1:length(theta)
    x0 = [5.7*pi/180,120*pi/180,175*pi/180,2.5];        
    options=optimset('Display','iter');  
    pos(i,:) = fsolve(@(pos) myfun(pos,theta(i)),x0,options); 
end

r_AB = 5.160;
r_CD = 1.12;
r_BC = 1.12;
r_DE = 2.95;

% Defined
r_EF = pos(:,4);
r_OA = 0.5;
r_FO = 3;
x_c  = 5;
y_c  = 2;

theta_dot = 50;


%Loop #1
R_OAx=(r_OA/2)*cos(theta);
R_OAy=(r_OA/2)*sin(theta);
R_ABx=(r_AB/2)*cos(pos(:,1));
R_ABy=(r_AB/2)*sin(pos(:,1));
R_BCx=(r_BC/2)*cos(pos(:,2));
R_BCy=(r_BC/2)*sin(pos(:,2));
R_COx=(x_c/2);
R_COy=(y_c/2);

%Loop #2
R_CDx=(r_CD/2)*sin(pos(:,2));
R_CDy=(r_CD/2)*cos(pos(:,2));
R_DEx=(r_DE/2)*cos(pi+pos(:,3));
R_DEy=(r_DE/2)*sin(pi+pos(:,3));
R_EFx=(1/2);
R_EFy=(0/2);
R_FOx=(0/2);
R_FOy=(1/2);

%% Dynamics Graphs
%% Graphs

r_EFy = r_FO; 
yEF(1:361) = r_EFy;
figure;
plot(pos(:,4),yEF, 'Linewidth', 1)
hold on
plot(.5*cos(theta),.5*sin(theta),'Linewidth', 1)
plot(1.12*cos(pos(:,2))+x_c , 1.12*sin(pos(:,2))+y_c, 'Linewidth', 1)
plot(1.12*cos(pos(:,2)+pi)+x_c , 1.12*sin(pos(:,2)+pi)+y_c, 'Linewidth', 1)
xlabel(' X [inches] ')
ylabel(' Y [inches] ')
legend('r_EF','r_OA','point D','point B')
%axis([-3.5 3.5 -2.5 2.5])



%%

%position

function F = myfun(pos,theta)
r_AB = 5.160;
r_CD = 1.12;
r_BC = 1.12;
r_DE = 2.95;

% Defined
r_EF = 2.5;
r_OA = 0.5;
r_FO = 3;
x_c  = 5;
y_c  = 2;

theta_dot = 50;

    F = [r_OA*cos(theta)+r_AB*cos(pos(:,1))+r_BC*cos(pos(:,2))-x_c;
    r_OA*sin(theta)+r_AB*sin(pos(:,1))+r_BC*sin(pos(:,2))-y_c;
    x_c+r_CD*cos(pos(:,2))+r_DE*cos(pos(:,3))-pos(:,4);
    y_c+r_CD*sin(pos(:,2))+r_DE*sin(pos(:,3))-r_FO];
   
    
    end 