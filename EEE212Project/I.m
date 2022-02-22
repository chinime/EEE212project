function current = I(component, X, f)
global t1;
    s = 1j*2*pi*f;
    
    [ nodeV, curr_thru_ind , curr_thru_v_src , curr_thru_vcvs , curr_thru_ccvs ] = data_read(X);
    componentc = char(component);
    
    idx = t1_look_up(component, t1.element(:));
    
    if ~idx
        current = [];
        return
    end
    
    value = t1.value(idx);
    voltage = V(component, X);
    
    if componentc(1) == 'R'
        current = voltage / value;
    elseif componentc(1) == 'C'
        current = voltage * s * value;
    elseif componentc(1) == 'G'
        current = (V(string(t1.cp_node(idx)), X) - V(string(t1.cn_node(idx)), X)) * value;
    elseif componentc(1) == 'L'
        idxs = specialized_t1_look_up('L', idx, t1.element(:));
        current = curr_thru_ind(idxs);
    elseif componentc(1) == 'V'
        idxs = specialized_t1_look_up('V', idx, t1.element(:));
        current = curr_thru_v_src(idxs);
    elseif componentc(1) == 'E'
        idxs = specialized_t1_look_up('E', idx, t1.element(:));
        current = curr_thru_vcvs(idxs);
    elseif component(1) == 'H'
        idxs = specialized_t1_look_up('H', idx, t1.element(:));
        current = curr_thru_ccvs(idxs);
    elseif componentc(1) == 'F'
        idxV = t1_look_up(t1.Vname(idx), t1.element(:));
        idxs = specialized_t1_look_up('V', idxV, t1.element(:));
        current = curr_thru_v_src(idxs) * value;
    end
end
        