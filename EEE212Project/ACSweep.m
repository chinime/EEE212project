function allX = ACSweep(values)
    allX = [];
    for k = 1:length(values)
        X = solve_for(1, values(k));
        allX = [allX X];
    end
end
    
    