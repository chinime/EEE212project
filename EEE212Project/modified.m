function [A, Z] = modified(freq)
global num_ind;
global num_v;
global num_vcvs;
global num_ccvs;
global i_unk;
global s;
    
    s = 1j*2*pi*freq;
    
    num_nodes = count_nodes();
    
    %% Stamping %%

    V = zeros(num_nodes,1);
    I = zeros(num_nodes,1);
    G = zeros(num_nodes,num_nodes);  
   
    
    B = zeros(num_nodes,i_unk);
    C = zeros(i_unk,num_nodes);
    D = zeros(i_unk,i_unk);
    E = zeros(i_unk,1);

    vcnt = 0;
    G = RCStamp(G);

    [B, C, D] = LStamp(B, C, D, vcnt);
    vcnt = vcnt + num_ind;

    [B, C, E] = VStamp(B, C, E, vcnt);
    vcnt = vcnt + num_v;

    I = IStamp(I);

    [B, C] = Estamp(B, C, vcnt);
    vcnt = vcnt + num_vcvs;

    [B, C, D] = HStamp(B, C, D, vcnt);
    vcnt = vcnt + num_ccvs;

    G = GStamp(G);

    [B,C] = FStamp (B, C, vcnt);


% if vcnt ~= i_unk
%     error("Some error happened");
% end

%% --- MAIN CALCULATION -- %%

    A = [G B; C D];
    Z = [I; E];
end



    







 