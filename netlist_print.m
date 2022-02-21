global num_rlc
global num_ind
global num_v
global num_i
global num_vcvs
global num_vccs
global num_cccs
global num_ccvs
global i_unk
 
global branch_cnt;
global line_cnt;

num_nodes = count_nodes();

fid = fopen('netlist_report.txt','w');

%% In the Netlist Report Window %%

fprintf(fid, '---Net list report---\n');
fprintf(fid, 'number of lines in netlist: %d\n',line_cnt);
fprintf(fid, 'number of branches: %d\n',branch_cnt);
fprintf(fid, 'number of nodes: %d\n',num_nodes);

fprintf(fid, 'number of unknown currents: %d\n',i_unk);
fprintf(fid, 'number of RLC (passive components): %d\n',num_rlc);
fprintf(fid, 'number of inductors: %d\n',num_ind);
fprintf(fid, 'number of independent voltage sources: %d\n',num_v);
fprintf(fid, 'number of independent current sources: %d\n',num_i);

fprintf(fid, 'number of E - VCVS: %d\n',num_vcvs);
fprintf(fid, 'number of G - VCCS: %d\n',num_vccs);
fprintf(fid, 'number of F - CCCS: %d\n',num_cccs);
fprintf(fid, 'number of H - CCVS: %d\n',num_ccvs);

fclose(fid);