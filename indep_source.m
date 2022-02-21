function type = indep_source(line_nu)
global content;
global t1;
    tk = split(content(line_nu));
    tk_cnt = length(tk);
    t1.element(line_nu) = (tk(1));
    
    t1.p_node(line_nu) = uint32(str2num(tk(2)));
    t1.n_node(line_nu) = uint32(str2num(tk(3)));
    if tk_cnt == 4
        t1.value(line_nu) = parseval(tk(4));
        type = 0;
    else
        t1.value(line_nu) = parseval(tk(5));
        t1.Type(line_nu) = tk(4);
        if tk(4) == "AC"
            type = 1;
            t1.value(line_nu) = t1.value(line_nu) * exp(1i*deg2rad(parseval(tk(6))));
        else
            type = 0;
        end
    end
end