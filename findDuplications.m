function flag = findDuplications
global t1;
    flag = false;
    if length(unique(t1.element)) < length(t1.element)
        flag = true;
        return
    end
end
    