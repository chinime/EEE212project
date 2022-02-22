function k = specialized_t1_look_up(ch, idx, elements)
    k = 0;
    for i = 1:length(elements)
        curr = elements(i);
        currc = char(curr);
        
        if currc(1) == ch
            k = k + 1;
        end
        
        if i == idx
            return;
        end
    end
end