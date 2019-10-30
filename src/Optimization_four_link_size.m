%% Optimization_four_link_size
clear all;clc;
%%%%%%%%%%%%%%%%%%%%%
% L_c=300e-6;   % um����to����m:  e-6
% L_s1=300e-6;   % um����to����m:  e-6
% L_s2=400e-6;   % um����to����m:  e-6
% L_s3=700e-6;   % um����to����m:  e-6
%%%%%%%%%%%%%%%%%%%%%
% �ο���2011-ICIRS-System identification, modeling, and optimization of ...
% an insect-sized flapping-wing micro air vehicle-Finio_IROS11_c-8p-�Ѵ�ӡ
%% ʵ��������õ������˵ĳ���
L_c=300e-6;   % um����to����m:  e-6
L_s1=500e-6;   % um����to����m:  e-6
L_s2=300e-6;   % um����to����m:  e-6
L_s3=630e-6;   % um����to����m:  e-6
%%%%%%%%%%%%%%%%%%%%%
%% ���Ż�������˳���
% L_c=312e-6;   % um����to����m:  e-6
% L_s1=400e-6;   % um����to����m:  e-6
% L_s2=291e-6;   % um����to����m:  e-6
% L_s3=498e-6;   % um����to����m:  e-6
% L_s3=L_s1;
%%%%%%%%%%%%%%%%%%%%%
x0= [L_c,L_s1,L_s2,L_s3];     % ��ʼֵ��Make a starting guess at the solution
%%%%%%%%%%%%%%%%%%%%%
objfun=@objTdiff_linear;  % ����Ŀ�꺯��
% objfun=@objTdiff_linear2;  % ����Ŀ�꺯��
% objfun=@objTdiff_nonlinear;  % ����Ŀ�꺯��
%%%%%%%%%%%%%%%%%%%%%
% ���ޱ߽�Լ��
% lb = [0e-6,0e-6,0e-6,0e-6];          % Set lower bounds 
lb = [50e-6,50e-6,50e-6,50e-6];          % Set lower bounds 
% lb = [100e-6,100e-6,100e-6,100e-6];          % Set lower bounds 
% lb = [200e-6,200e-6,200e-6,200e-6];         % Set lower bounds
% ub = [1000e-6, 1000e-6,300e-6,1000e-6];  % Set upper bounds
ub = [1000e-6, 1000e-6,300e-6,1000e-6];  % Set upper bounds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (1)��Լ����С���Ż�%%%%%%%%%%%%%%%%%%%
% options=optimset('Display','iter-detailed'); % �о���
% options = optimset('Algorithm','active-set');
% options=optimset('Algorithm','active-set','Display','iter-detailed','TolX',1e-15,'TolFun',1e-15);
options=optimset('Algorithm','active-set','Display','iter-detailed','MaxFunEvals',160000,'MaxIter',160000,'TolX',1e-6,'TolFun',1e-6);
[x,fval] =fmincon(objfun,x0,[],[],[],[],lb,ub,[],options);
optimal_four_link_size=x*10^6
%%%%%%%%%%%%%%%%%%%%%%%%%
optimal_four_link_size =[445.8109  564.1168  297.1740  439.1168]; % objTdiff_linear % delta_pp=250e-6;
% optimal_four_link_size =[1.0e+003*[0.7437    1.0000    0.3000    0.0500]; % objTdiff_nonlinear % delta_pp=250e-6;
% optimal_four_link_size =[151.9739  287.0379  252.8867  137.0379]; %objTdiff_linear % delta_pp=300e-6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% (2)�Ŵ��Ż�%%%%%%%%%%%%%%%%%%%%%%
% nvars=4; 
% options=gaoptimset('Display','iter','PopulationSize',100,'InitialPopulation',x0,'Generations',100,...   
%     'PlotFcns',{@gaplotbestf,@gaplotexpectation,@gaplotstopping,@gaplotbestindiv,@gaplotscores,@gaplotrange},...
%     'TolCon',1e-15,'TolFun',1e-15);
% % [x,fval,exitflag,output,population,scores]=ga(objfun,nvars,[],[],[],[],lb,ub,[],options);
% [x,fval,exitflag,output,population,scores]=ga(objfun,nvars,[],[],[],[],[],[],[],options);
% optimal_four_link_size=x*10^6
%%%%%%%%%%%%%%%%%%%%%%%%%
% optimal_four_link_size =[126.2911  425.3004  299.7783  300.4309]; %objTdiff_linear % delta_pp=250e-6;
% optimal_four_link_size = [809.8771  437.3803  148.6466  997.9489]; %objTdiff_linear % delta_pp=250e-6;
% optimal_four_link_size =[980.0851  395.5998  264.5352  221.1999];  %objTdiff_nonlinear % delta_pp=250e-6;
% optimal_four_link_size =[999.5998  717.7664  283.3348  543.2837];  %objTdiff_nonlinear % delta_pp=250e-6;
% optimal_four_link_size =1.0e+007*[0.0048    0.0591    1.1174    0.0591]; % objTdiff_linear % ��Լ�� % delta_pp=250e-6;
% optimal_four_link_size =1.0e+007*[0.1930    0.0961    1.2368    0.0962]; % objTdiff_nonlinear % ��Լ�� % delta_pp=250e-6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


