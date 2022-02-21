function allX = DCSweep(varName, values)
global t1;

    allX = [];
    t1o = t1;
    idx = t1_look_up(varName, t1.element(:));
    for i = 1:length(values)
        t1.value(idx) = values(i);
        [A, Z] = modified(0);
         X = inv(A)*Z;
         allX = [allX X];
    end
  
    t1 = t1o;
end