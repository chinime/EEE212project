function numval = parseval(value)
    number = double(regexpi(value, '[0-9_._-]*', 'match'));
    words = lower(regexprep(join(regexpi(value, '[^0-9_._A_a_V_v_H_h_F_f_-]', 'match')), " ", ""));
    
    if length(words) == 0
        numval = number;
        return;
    end
    
    switch words
        case "meg"
            numval = number * 10^6;
            return
        case "t"
            numval = number * 10^12;
            return
        case "g"
            numval = number * 10^9;
            return
        case "k"
            numval = number * 10^3;
            return
         case "m"
            numval = number * 10^-3;
            return
         case "u"
            numval = number * 10^-6;
            return
         case "n"
            numval = number * 10^-9;
            return
         case "p"
            numval = number * 10^-15;
            return
        otherwise
            numval = NaN;
    end
end
         
   