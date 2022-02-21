# EEE212project
Circuit Simulator with Netlist Parser and a layered GUI

Open project_main.mlapp to get to the start page of the project

Click on "Start"

Select "File" if you want to upload a netlist txt file or "Text" if you want to manually write netlist, click "Done Writing" if you are done

Push on the "Simulate" button and follow the options available:

1. If no instruction given, it opens a GUI to take the instructions
2. Supported components are V, I, R, L, C, VCVS, CCCS, VCCS and CCVS.
3. V and I can be DC or a single frequency sinusoidal AC (default frequency is set at 1 KHz)
4. AC source are represented as <name> <p_node> <n_node> AC <magnitude> <phase>
5. The simulation options are DC Sweep, AC Sweep and Bias Point Details and the commands supported are print, probe, dc, ac and op
6. For Bias point, if any AC source present, it does seperate DC and sinusoidal analysis
7. You can write comments (in netlist format) in your netlist file and it will be read just fine  
8. You can give alphaneumeric value representations (1k, 1u, 10.25Meg) along with the units*
  
*Option 8 not available for the GUI that will open if no instructions are present
