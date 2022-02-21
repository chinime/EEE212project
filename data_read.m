function [nodeV, curr_thru_ind ,curr_thru_v_src,curr_thru_vcvs,curr_thru_ccvs] = data_read(X)
global num_ind
global num_v
global num_vcvs
global num_ccvs
    
    num_nodes = count_nodes();
    
    curr_thru_ind = [];
    curr_thru_v_src = []; 
    curr_thru_vcvs = [];
    curr_thru_ccvs = [];
    
    now = num_nodes;
    nodeV = X(1:now);

    if num_ind
        curr_thru_ind = X(now+1:now+num_ind);
    end

    now = now + num_ind;

    if num_v
        curr_thru_v_src = X(now+1:now+num_v);
    end

    now = now + num_ind;

    if num_vcvs
        curr_thru_vcvs = X(now+1:now+num_vcvs);
    end

    now = now + num_vcvs;

    if num_ccvs
        curr_thru_ccvs = X(now+1:now+num_ccvs);
    end

    now = now + num_ccvs;
end