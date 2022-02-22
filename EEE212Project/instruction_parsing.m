global content;
global t1;
global AC_src;
global instructions;

fid = fopen('instruction_evaluating.txt','w');
op_encountered = false;
op_X = [];

    for i = 1:length(instructions)
        ins = split(upper(instructions(i)));
        switch ins(1)
            
    
            case ".DC"
                % do a DC Sweep
                if length(AC_src) > 0
                    fprintf(fid, "'.dc' not supported for AC variables\n");
                    fclose(fid);
                    error("'.dc' not supported for AC variables");
                end
                % Call the DC Sweep Command wrt to the given variable %
                var_name = ins(2);
                if ~t1_look_up(var_name, t1.element(:))
                    fprintf(fid, "No variable by the name %s found\n", var_name);
                    fclose(fid);
                    error("No variable by the name %s found", var_name);
                end
                fprintf(fid, "Doing a DC sweep wrt %s\n", var_name);
                startVal = double(ins(3));
                endVal = double(ins(4));
                interval = double(ins(5));
                values = startVal:interval:endVal;
                
                allX = DCSweep(var_name, values);
                
                % Now open the probe window %
                % Get what's being clicked %
                % Find the curve of clicked vs var_name %
                
                
            case ".PRINT"
                if length(AC_src) > 0
                    % Command (1) %
                    fprintf(fid, "Printing for AC\n");
                    X = solve_for(1);
                    
                    want = ins(2:end);
                    
                    for k = 1:length(want)
                        exp = regexprep(want(k), " *", "");
                        value = whaccuwant(exp, X);
                        
                        if isempty(value)
                            fprintf(fid, "Expression not detected - %s\n", want(k));
                            fclose(fid);
                            error("Expression not detected - %s", want(k));
                        end
                        
                        mag = abs(value);
                        phase = rad2deg(angle(value));
                        
                        fprintf(fid, "%s = %0.4fsin(2*pi*f*t + %0.4f) for f = 1 kHz\n", exp, mag, phase); 
                    end
                    
                    % Netlist typically prints the avg values 
                    % Since we are taking pure sinusoids, netlist would've
                    % given 0, but we are printing the whole sinusoids
                end
        
                if op_encountered == true
                    % Command (0) %
                    fprintf(fid, "Printing for DC\n");
                    want = ins(2:end);
                    
                    for k = 1:length(want)
                        exp = regexprep(want(k), " *", "");
                        value = whaccuwant(exp, op_X);
                        
                        if isempty(value)
                            fprintf(fid, "Expression not detected - %s\n", want(k));
                            fclose(fid);
                            error("Expression not detected - %s", want(k));
                        end
                    end
                    
                    fprintf(fid, "%s = %0.4f\n", exp, value); 
                    
                else
                    fprintf(fid, "Could not print for DC as no '.op' detected\n");
                end
                
                
                
            case ".PROBE"
                % probe - determine which things appear in the window
                if length(ins) == 1
                    % open a probe window with all the values in the
                    % dropdown
                else
                    % Get the selected options in the dropdown
                end
                
                
                
            case ".OP"
                % Find the matrix A, X and Z for all DC sources
                if length(ins) > 1
                    fprintf(fid, "%s command not detected\n", instructions(i));
                    fclose(fid);
                    error(fid, "%s command not detected", instructions(i));
                end
                
                fprint(fid, "Doing a bias point analysis\n");
                op_X = solve_for(0);
         
                op_encounterd = true;
                
                
                
            case ".AC"
                % Do an AC sweep %
                
                if length(ins) == 1
                    fprintf(fid, "AC specs not specified");
                    fclose(fid);
                    error(fid, "AC specs not specified");
                end
                
                fprint(fid, "Doing an AC Sweep\n");
                
                N = ins(3);
                startVal = ins(4);
                endVal = ins(5);
                
                if ins(2) == "LIN"
                    values = linspace(startVal, endVal, N);
                elseif ins(2) == "DEC"
                    values = logspace(log10(startVal), log10(endVal), N*10*log10(endVal/startVal));
                elseif ins(2) == "OCT"
                    fprintf(fid, "AC Sweep not supported for octal\n");
                    fclose(fid);
                    error("AC Sweep not supported for octal")
                else
                    fprintf(fid, "%s not detected\n", ins(2));
                    fclose(fid);
                    error("%s not detected\n", ins(2));
                end
                
                allX_ac = ACSweep(values);
                
                % Now open a probe window %
                
                
            case ".END"
                fprintf(fid, "Ending simulation");
                break;
                
                
                
            otherwise
                fprintf(fid, "%s command not detected\n", ins(1));
                fclose(fid);
                error("%s command not detected", ins(1));
        end
        fclose(fid);
    end
