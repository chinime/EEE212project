function ccvs_sub_network(line_nu)
global content;
global t1;
    tk = split(content(line_nu));
    t1.element(line_nu) = (tk(1));
    t1.p_node(line_nu) = uint32(str2num(tk(2)));
    t1.n_node(line_nu) = uint32(str2num(tk(3)));
    t1.Vname(line_nu) = upper(tk(4));
    t1.value(line_nu) = parseval(tk(5));
end