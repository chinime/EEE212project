function I = IStamp(I)
global t1;
    for i = 1:size(t1,1)
         n1 = t1.p_node(i);
         n2 = t1.n_node(i);

        temp = char(t1.element(i));
        x = temp(1);

        if x == 'I'
            g = t1.value(i);

            if n1 ~= 0
                I(n1) = I(n1) - g;
            end

            if n2 ~= 0
                I(n2) = I(n2) + g;
            end
        end
    end
end