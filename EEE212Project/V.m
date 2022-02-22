function voltage = V(component, X)
global t1;
    num_nodes = count_nodes();
    nodeV = X(1:num_nodes);
    
    if ~isempty(regexp(component, '[a-z_A-Z]', 'match'))
        idx = t1_look_up(component, t1.element(:));
        if idx
            p_node = t1.p_node(idx);
            n_node = t1.n_node(idx);
            
            if p_node == 0
                right = 0;
            else
                right = nodeV(p_node);
            end
            
            if n_node == 0
                left = 0;
            else
                left = nodeV(n_node);
            end
                
            voltage = right - left;
        else
            voltage = [];
        end
    else 
        node_no = str2num(component);
        if node_no == 0
            voltage = 0;
        elseif (node_no < 0) || (node_no > count_nodes())
            voltage = [];
        else
            voltage = nodeV(node_no);
        end
    end
end

