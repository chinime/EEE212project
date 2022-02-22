function largest = count_nodes()
global content;
global t1;
    line_cnt = length(content);
    p = zeros(1, line_cnt);
    for i = 1:line_cnt
        p(t1.p_node(i)+1) = p(t1.p_node(i)+1) + 1;
        p(t1.n_node(i)+1) = p(t1.n_node(i)+1) + 1;
    end
    
    if max(t1.n_node(:)) > max(t1.p_node(:))
        largest = max(t1.n_node(:));
    else
        largest = max(t1.p_node(:));
    end
    
    largest = uint32(largest);
    
    for i = 1:largest+1
        if p(i) == 1
            error("There has to be atleast 2 instances of node %d", i-1);
        end
    end
end
    