function obj_Tdiff=objTdiff_linear(x)
L_c=x(1);
L_s1=x(2);
L_s2=x(3);
L_s3=x(4);
% L_s3=L_s1;
% ѹ���������������ֵλ��
delta_pp=250e-6;   % um����to����m:  e-6����delta_pp=(-250,250)um
% delta_pp=300e-6;
delta=delta_pp;      % ȡ��ֵλ��
%% �����ǳ���Ĵ�ǹ���ѹ��������λ�Ƶ�ƫ����
dphi_l_to_ddelta=(2*((1/2)*(-2*L_c-2*L_s1+2*L_s3+2*delta)./...
    (sqrt(L_s2^2+L_s1^2-2*L_s1*L_s3+L_s3^2).*...
    sqrt(L_s2^2+L_c^2+2*L_c*L_s1-2*L_c*L_s3-2*L_c.*delta+L_s1^2-2*L_s1*L_s3-2*L_s1.*delta+L_s3^2+2*L_s3.*delta+delta.^2))-...
    (1/4)*((L_c+L_s1-L_s3-delta).^2+2*L_s2^2+(L_s1-L_s3)^2-L_c^2).*(-2*L_c-2*L_s1+2*L_s3+2*delta)...
    ./(sqrt(L_s2^2+L_s1^2-2*L_s1*L_s3+L_s3^2).*...
    (L_s2^2+L_c^2+2*L_c*L_s1-2*L_c*L_s3-2*L_c.*delta+L_s1^2-2*L_s1*L_s3-2*L_s1.*delta+L_s3^2+2*L_s3.*delta+delta.^2).^(3/2))))./...
    sqrt(4-((L_c+L_s1-L_s3-delta).^2+2*L_s2^2+(L_s1-L_s3)^2-L_c^2).^2./...
    ((L_s2^2+L_s1^2-2*L_s1*L_s3+L_s3^2).*...
    (L_s2^2+L_c^2+2*L_c*L_s1-2*L_c*L_s3-2*L_c.*delta+L_s1^2-2*L_s1*L_s3-2*L_s1.*delta+L_s3^2+2*L_s3.*delta+delta.^2)))...
    -L_s2./((L_c+L_s1-L_s3-delta).^2.*(1+L_s2^2./(L_c+L_s1-L_s3-delta).^2));
%%%%%%%%%%%%%%%%%%%%%%%%%
T_est=1/L_s2;
obj_Tdiff=(abs(dphi_l_to_ddelta)-T_est).^2;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % phi_l=(1/2)*pi-acos((1/2)*((L_c+L_s1-L_s3-delta).^2+2*L_s2^2+(L_s1-L_s3)^2-L_c^2)...
% %           ./(sqrt(L_s2^2+(L_s1-L_s3)^2)*sqrt(L_s2^2+(L_c+L_s1-L_s3-delta).^2)))-...
% %          atan2(L_s2,(L_c+L_s1-L_s3-delta))-atan2((L_s1-L_s3),L_s2);  % atan2(,)
%%%%%%%%%%%%%%%%%%%%%%%%%  
% phi_l=(1/2)*pi-acos((1/2)*((L_c+L_s1-L_s3-delta).^2+2*L_s2^2+(L_s1-L_s3)^2-L_c^2)...
%           ./(sqrt(L_s2^2+(L_s1-L_s3)^2)*sqrt(L_s2^2+(L_c+L_s1-L_s3-delta).^2)))-...
%          atan(L_s2./(L_c+L_s1-L_s3-delta))-atan((L_s1-L_s3)./L_s2); % atan()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% T_theor=-phi_l/delta;     
% obj_Tdiff=(abs(dphi_l_to_ddelta)-abs(T_theor)).^2;       %  obj_Tdiff=dphi_l_to_ddelta-T_theor;
%%%%%%%%%%%%%%%%%%%%%%%%%
end