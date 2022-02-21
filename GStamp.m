function G = GStamp(G)
global t1;
    for i = 1 : size(t1, 1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        cn1 = t1.cp_node(i);
        cn2 = t1.cn_node(i);
        temp = char(t1.element(i));
        x = temp(1);
        
        if x == 'G'
            if (n1 == 0)
                if cn1 == 0
                    G(n2, cn2) = G(n2, cn2) + t1.value(i);
                elseif cn2 == 0
                    G(n2, cn1) = G(n2, cn1) - t1.value(i);
                else
                    G(n2, cn2) = G(n2, cn2) + t1.value(i);
                    G(n2, cn1) = G(n2, cn1) - t1.value(i);
                end
            elseif (n2 == 0)
                if cn1 == 0
                    G(n1, cn2) = G(n1, cn2) - t1.value(i);
                elseif cn2 == 0
                    G(n1, cn1) = G(n1, cn1) + t1.value(i);
                else
                    G(n1, cn2) = G(n1, cn2) - t1.value(i);
                    G(n1, cn1) = G(n1, cn1) + t1.value(i);
                end
            else
                if cn1 == 0
                    G(n1, cn2) = G(n1, cn2) - t1.value(i);
                    G(n1, cn2) = G(n1, cn2) + t1.value(i);
                elseif cn2 == 0
                    G(n1, cn1) = G(n1, cn1) + t1.value(i);
                    G(n2, cn1) = G(n2, cn1) - t1.value(i);
                else
                    G(n1, cn1) = G(n1, cn1) + t1.value(i);
                    G(n1, cn2) = G(n1, cn2) - t1.value(i);
                    G(n2, cn1) = G(n2, cn1) - t1.value(i);
                    G(n2, cn2) = G(n2, cn2) + t1.value(i);
                end
            end
        end
    end
end