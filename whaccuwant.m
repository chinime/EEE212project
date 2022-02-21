function value = whaccuwant(exp, X, f)
    expc = char(exp);
    what = expc(1);
    
    across_what = string(expc(3:end-1));
    
    if what == 'I'
        % get the current across across_what
        value = I(across_what, X, f);
    elseif what == 'V'
        % get the current across across_what
        value = V(across_what, X);
    end
end