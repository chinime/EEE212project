function flag = srclen(len)
% Returns true if 'not mentioned DC' src is found
flag = false;
global content;
    for i = 1:length(content)
        temp = char(content(i));
        x = temp(1);
        if (x == 'I') || (x == 'V')
            if length(regexp(content(i), " ", 'match')) == len-1
                flag = true;
                return
            end
        end
    end
end