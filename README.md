# EEE212project
Circuit Simulator with Netlist Parser and a layered GUI

Open project_main.mlapp to get to the start page of the project

Click on "Start"

Select "File" if you want to upload a netlist txt file or "Text" if you want to manually write netlist, click "Done Writing" if you are done

Push on the "Simulate" button and follow the options available:

1. If no instruction given, it opens a GUI to take the instructions
2. Supported components are V, I, R, L, C, VCVS, CCCS, VCCS and CCVS.
3. V and I can be DC or a single frequency sinusoidal AC (default frequency is set at 1 KHz)
4. The simulation options are DC Sweep, AC Sweep and Bias Point Details and the commands supported are print, probe, dc, ac and op
5. For Bias point, if any AC source present, it does seperate DC and sinusoidal analysis
6. You can input your netlist file with comments (in netlist format) and alphaneumeric value representations (1k, 1u, 10.25Meg)
