# Xilinx assignments

Assignment 3 and 4 is accidentally merged in ass-3. Sorry for the inconvenience.

## Get the assignments  
1. Download the assignments - `git clone https://github.com/SayantanRC/xilinx_assignments.git` or Click on the green download button and extract it.  
2. Download Xilinx 17.4 ISE from https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/design-tools.html
3. Install it. For Linux users, the following script maybe useful:
> #!/bin/bash  
> #<xilinx_installation_dir> is usually /opt/Xilinx  
> #if you are installing somewhere else, make a symlink:  
> #sudo mkdir -p /opt/Xilinx && sudo ln -s <xilinx_installation_dir>/14.7 /opt/Xilinx  
> source <xilinx_installation_dir>/14.7/ISE_DS/settings32.sh  
> cd <xilinx_installation_dir>/14.7/ISE_DS/ISE/bin/lin64  
> ./ise  
4. Open the assignments by <b>File->Open Project</b> option.  
5. In the Open project window, navigate to the assignment folder and open the <b>assignment_name.xise</b> file.  

## Run the assignments  
1. In the left <b>Design</b> column, click on the <b>Implementation</b> radio button.  
2. Click on a testbench file (ending with tb in the name)  
3. Double click on <b>Simulate Behavioral Model<b/>  
