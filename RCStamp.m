function G = RCStamp(G)
global t1;
global s;
    for i = 1 : size(t1, 1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        
        temp = char(t1.element(i));
        x = temp(1);

        if (x == 'R') || (x == 'C')
            if x == 'R'
                g = 1/t1.value(i);
            end

            if x == 'C'
                g = s*t1.value(i);
            end     
            
%             if x == 'L'
%                 g = 1/(s*t1.value(i));
%             end

            if(n1 == 0)
                G(n2, n2) = G(n2, n2) + g;
            elseif (n2 == 0)
                G(n1, n1) = G(n1, n1) + g;
            else
                G(n1, n2) = G(n1, n2) - g;
                G(n2, n1) = G(n2, n1) - g;
                G(n2, n2) = G(n2, n2) + g;
                G(n1, n1) = G(n1, n1) + g;
            end
        end
    end
end