function rlc_element(line_nu)
global content;
global t1;
    tk = split(content(line_nu));
    t1.element(line_nu) = (tk(1));
    t1.p_node(line_nu) = uint32(str2num(tk(2)));
    t1.n_node(line_nu) = uint32(str2num(tk(3)));
    t1.value(line_nu) = parseval(tk(4));
end