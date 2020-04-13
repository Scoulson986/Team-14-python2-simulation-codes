%%%%%%%%%%%%%%%
% 
% quick and dirty plotting of car data from v_rep
% March 14, 2017
filename = 'car_data.csv'
data = csvread(filename,8,0);

% data format 
%  csvfile.writerow({'t': time, 'x': pos[0], 'y': pos[1], 'speed': vel,
%                         'lat_err': lat_err, 
%                         'line0_err': (line0_err or ""), 
%                         'line1_err': (line1_err or ""), 
%                         'steer_angle': steer_angle
%                         })

% Timestamps
time = data(:,1);
maxt = max(time)+0.3;
mint = min(time)
% 
lat_err = data(:,5); % lateral error in meters
vel = data(:,4); % car longitudinal velocity
steer_angle = data(:,8); % steering angle in degrees

%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
ftsz = 12;
clf;
set(gcf,'color','w');
set(gcf,'Units','inches');
set(gcf,'Position',[1 1 8 4]);

subplot(3,1,1);hold all;box on;
plot(time,lat_err,'LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('lat err (m)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('lat err');
xlabel('Time (s)','fontsize',ftsz);
xlim([0 maxt]);
ylim([-0.3 0.3]);
grid on;

subplot(3,1,2);hold all;box on;
plot(time,steer_angle,'LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('angle (deg)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('Steering angle');
xlabel('Time (s)','fontsize',ftsz);
xlim([0 maxt]);
ylim([-35 35]);

% plot car velocity
subplot(3,1,3);hold all;box on;
plot(time,vel,'LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('velocity (m/s)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('velocity');
xlabel('Time (s)','fontsize',ftsz);
xlim([0 maxt]);
ylim([0 4]);
grid on;

%display('line 87')
%return; % for debugging
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot of lateral and steering error
% figure(2)
% clf;
% ha = tight_subplot(2,1,[.02 0],[.1 .08],[.1 .01]);
% 
% axes(ha(1)); plot(time,lat_err,...
%     'k','LineWidth',2);
% ylabel('error(m)','FontSize', 14, 'FontName', 'CMU Serif');axis([0,maxt,-2.1,2.1]); 
% legend('lateral error','Location','west');
% axis([0,maxt,-.1,.1]); 
% 
% axes(ha(2)); 
% hold on; plot(time,steer_angle,...
%     'k','LineWidth',2);
% ylabel('angle (degrees)','FontSize', 14, 'FontName', 'CMU Serif');
% legend('steering angle','Location','west');
% axis([0,maxt,-30,30]); % legend('Gx','Gy', 'Gz','Location','west');
%    
% for i = 1:2
%     axes(ha(i));
%     set(gca,'FontName','CMU Serif','FontSize',14);
%     %axis([0,10,-1.5,1.5]);
%     hold on
%     temp = get(gca,'XTick');
%     plot([temp(1),temp(end)],[0,0],'k','LineWidth',1);
%     grid OFF
%     
% end
% axes(ha(2));
% xlabel('Time (s)','FontSize', 18, 'FontName', 'CMU Serif');
% set(gcf,'Units','inches');
% set(gcf,'Position',[1 1 12 8]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot of actual track position

figure(3);
ftsz = 12;
clf;
set(gcf,'color','w');
set(gcf,'Units','inches');
set(gcf,'Position',[1 1 8 4]);

xpos = data(:,2); % x position of car
ypos = data(:,3); % y position of car
% {'t': time, 'x': pos[0], 'y': pos[1], 'speed': vel,

plot(xpos,ypos,'LineWidth',1.5)
line([0 12.3],[0 0],'color','c');  % high light x axis
ylabel('ypos (m)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('car pos');
xlabel('position (m)','fontsize',ftsz);
xlim([-6 9]);
ylim([-7 +6.5]);
grid on;


%%%%%%%%%%%%%%%
% combined plot of lateral error and actual track position
figure(4)
ftsz = 12;
clf;
set(gcf,'color','w');
set(gcf,'Units','inches');
set(gcf,'Position',[1 1 8 4]);

subplot(1,2,1);hold all;box on;
plot(time,lat_err,'color','k','LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('lat err (m)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('lat err');
xlabel('Time (s)','fontsize',ftsz);
xlim([2 maxt]);
ylim([-0.15 0.15]);
grid on;

subplot(1,2,2);hold all;box on;
plot(-ypos,xpos,'color','k','LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('ypos (m)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('car pos');
xlabel('position (m)','fontsize',ftsz);
xlim([-6 8.5]);
ylim([-3.5 +6]);
grid on;

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
figure(5);
ftsz = 12;
clf;
set(gcf,'color','w');
set(gcf,'Units','inches');
set(gcf,'Position',[1 1 8 4]);

subplot(2,1,1);hold all;box on;
plot(time,lat_err,'LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('lat err (m)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('lat err');
%xlabel('Time (s)','fontsize',ftsz);
xlim([0 maxt]);
ylim([-0.3 0.3]);
grid on;

subplot(2,1,2);hold all;box on;
plot(time,steer_angle,'LineWidth',1.5)
line([0 12.3],[0 0],'color','k');
ylabel('angle (deg)','fontsize',ftsz)
set(gca,'fontsize',ftsz);
legend('Steering angle');
xlabel('Time (s)','fontsize',ftsz);
xlim([0 maxt]);
ylim([-35 35]);
