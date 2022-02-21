function total = dropdownmenu()
global t1
    load probe_vars.mat;
    total = [];
    if isempty(probe_vars)
        %% all the node voltages
        num_nodes = count_nodes();
        for i = 1:num_nodes
            currstr = strcat("V(", string(i), ")");
            total = [total currstr];
        end

        %% all the component voltages and currents 
        for i = 1:size(t1,1)
            currstr = strcat("V(", t1.element(i), ")");
            total = [total currstr];
        end

        for i = 1:size(t1,1)
            currstr = strcat("I(", t1.element(i), ")");
            total = [total currstr];
        end
    else
        total = probe_vars;
    end
end