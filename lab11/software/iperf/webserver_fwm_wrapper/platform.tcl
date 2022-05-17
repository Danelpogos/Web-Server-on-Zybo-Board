# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/danny/class/labs/lab11/software/iperf/webserver_fwm_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/danny/class/labs/lab11/software/iperf/webserver_fwm_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {webserver_fwm_wrapper}\
-hw {/home/danny/class/labs/lab11/hardware/exports/webserver_fwm_wrapper.xsa}\
-out {/home/danny/class/labs/lab11/software/iperf}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {lwip_tcp_perf_server}
platform generate -domains 
platform active {webserver_fwm_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
