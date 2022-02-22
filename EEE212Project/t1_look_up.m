function i = t1_look_up(stuff, col)
    n = length(col);
    for i = 1:n
        if col(i) == stuff
            return
        end
    end
    i = 0;
end


    