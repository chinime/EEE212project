function [B, C] = Estamp(B, C, numV)
global t1
    numv_thus_far = numV;
    for i = 1 : size(t1, 1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        temp = char(t1.element(i));
        x = temp(1);
        
        if x == 'E'
             numv_thus_far = numv_thus_far + 1;
            if (n1 == 0)
                B(n2, numv_thus_far) = B(n2, numv_thus_far) - 1;
            elseif (n2 == 0)
                B(n1, numv_thus_far) = B(n1,numv_thus_far) + 1;
            else
                B(n2,numv_thus_far) = B(n2, numv_thus_far) - 1;
                B(n1,numv_thus_far) = B(n1, numv_thus_far) + 1;
            end
        end
    end
    
    numv_thus_far = numV;
    for i = 1:size(t1,1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        temp = char(t1.element(i));
        x = temp(1); 

        if x == 'E'
            numv_thus_far = numv_thus_far + 1;
            if (n1 == 0)
                C(numv_thus_far,n2) = C(numv_thus_far,n2) - 1;
            elseif (n2 == 0)
                C(numv_thus_far,n1) = C(numv_thus_far,n1) + 1;
            else
                C(numv_thus_far,n2) = C(numv_thus_far,n2) - 1;
                C(numv_thus_far,n1) = C(numv_thus_far,n1) + 1;
            end
        end
    end
    
    numv_thus_far = numV;
    
    for i = 1 : size(t1, 1)
        cn1 = t1.cp_node(i);
        cn2 = t1.cn_node(i);
        temp = char(t1.element(i));
        x = temp(1);
        
        if x == 'E'
            numv_thus_far = numv_thus_far + 1;
            if (cn1 == 0)
                C(numv_thus_far, cn2) = C(numv_thus_far, cn2) + t1.value(i);
            elseif (cn2 == 0)
                C(numv_thus_far, cn1) = C(numv_thus_far, cn1) -t1.value(i);
            else
                C(numv_thus_far, cn2) = C(numv_thus_far, cn2) + t1.value(i);
                C(numv_thus_far, cn1) = C(numv_thus_far, cn1) - t1.value(i);
            end
        end
    end
end



