function [B, C, D] = LStamp(B, C, D, numV)
global s;
global t1

    numv_thus_far = numV;
    for i = 1 : size(t1,1)
        n1 = t1.p_node(i);
        n2 = t1.n_node(i);
        temp = char(t1.element(i));
        x = temp(1);

        if x == 'L' 
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

        if x == 'L'
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
    for i = 1:size(t1,1)
        temp = char(t1.element(i));
        x = temp(1); 

        if x == 'L'
            numv_thus_far = numv_thus_far + 1;
            D(numv_thus_far,numv_thus_far) = D(numv_thus_far,numv_thus_far) - s*t1.value(i);
        end
    end

    