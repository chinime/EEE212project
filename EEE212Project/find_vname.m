function [n1,n2,j]=find_vname(name)
global t2;
    j = 0;
    for i = 1:size(t2,1)
        if ~ismissing(t2.element(i))
            j = j + 1;
        end
        if name == t2.element(i)
            n1 = t2.p_node(i);
            n2 = t2.n_node(i);
            return;
        end
    end
            
    error('failed to find matching branch element in find_vname');
end