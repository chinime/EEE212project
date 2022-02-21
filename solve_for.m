    function X = solve_for(type, freq)
global t1;
global AC_src;
global DC_src;
    t10 = t1;
    if type == 1
        for k = 1:length(DC_src)
            t1.value(DC_src(k)) = 0;
        end
        if isempty(freq)
            freq = 1000; % default print freq = 1 kHz;
        end
    else
        for k = 1:length(AC_src)
            t1.value(AC_src(k)) = 0;
        end
        freq = 0;
    end
    
    [A, Z] = modified(freq); 
    X = inv(A)*Z;
    t1 = t10;
end