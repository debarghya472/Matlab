function Foucalt_Pendulum
% This programme will numerically solve the equation of motion of a foucault
% pendulum for different initial condition.
TSPAN=linspace(0,10,10000);
% Initial Condition for Pendulum
initial_displacement_x=0.005;
initial_velocity_x=0.0;

initial_displacement_y=0.0;
initial_velocity_y=0.0;

z0=[initial_displacement_x initial_displacement_y initial_velocity_x initial_velocity_y];


[t,z] = ode45(@odefun,TSPAN,z0);

%plot x vs t
figure(1)
plot(TSPAN ,z(:,1),'b')
ylabel('Displacement-X');xlabel('Time');title('L=1 --- Plot of x vs t ');
%plot y vs t
figure(2)
plot(TSPAN ,z(:,2),'b')
ylabel('Displacement-Y');xlabel('Time');title('L=1 --- Plot of y vs t ');
%plot y vs x
figure(3)
plot(z(:,1) ,z(:,2),'b')
ylabel('Displacement-Y');xlabel('Displacement-X');title('L=1 --- Plot of y vs x ');

% functions

function zdot= odefun(t,z)
g=9.81;L=1;w=7.29e-5;lat=25.5941;
   
zdot=[z(3);z(4); 
-g/L*z(1)+2*w*sind(lat)*z(4);
-g/L*z(2)-2*w*sind(lat)*z(3)];


