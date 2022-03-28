clear
clc

X=xlsread('VORLAX EXECUTER.xlsm','X');
Y=xlsread('VORLAX EXECUTER.xlsm','Y');
CPBot=xlsread('VORLAX EXECUTER.xlsm','CP_Bottom');
CPTop=xlsread('VORLAX EXECUTER.xlsm','CP_Top');

for i= 1:20
    for j = 1:80
        if CPTop(i,j)<=-0.315
            CPTOPMOD(i,j)=1;
        else
            CPTOPMOD(i,j)=0;
        end
    end
end


for j=1:80
    A=min(CPTop(:,j));
    for i=1:20
        if CPTop(i,j)==A
            CPTOPLINE(i,j)=1;
        else 
            CPTOPLINE(i,j)=0;
        end
    end
end

figure
contourf(X,Y,CPBot,30)
xlabel('X (ft)')
ylabel('Y (ft)')
title('Contour of CP_b_o_t_t_o_m')
h = colorbar;
set(get(h,'label'),'string','CP');
grid on

figure
contourf(X,Y,CPTop,30)
xlabel('X (ft)')
ylabel('Y (ft)')
title('Contour of CP_t_o_p')
h = colorbar;
set(get(h,'label'),'string','CP');
grid on

figure
contourf(X,Y,CPTOPMOD,1)
xlabel('X (ft)')
ylabel('Y (ft)')
title('Contour of CP_t_o_p_M_O_D')
h = colorbar;
set(get(h,'label'),'string','CP');
grid on

figure
contourf(X,Y,CPTOPLINE,1)
xlabel('X (ft)')
ylabel('Y (ft)')
title('Contour of CP_t_o_p_L_I_N_E')
h = colorbar;
set(get(h,'label'),'string','CP');
grid on