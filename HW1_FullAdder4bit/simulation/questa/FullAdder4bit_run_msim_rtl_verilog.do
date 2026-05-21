transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/andy8/Desktop/NTUT_Computer_Organization/HW5/HW1_FullAdder4bit {C:/Users/andy8/Desktop/NTUT_Computer_Organization/HW5/HW1_FullAdder4bit/FullAdder4bit.v}

vlog -vlog01compat -work work +incdir+C:/Users/andy8/Desktop/NTUT_Computer_Organization/HW5/HW1_FullAdder4bit {C:/Users/andy8/Desktop/NTUT_Computer_Organization/HW5/HW1_FullAdder4bit/FullAdder4bit_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  FullAdder4bit_tb

add wave *
view structure
view signals
run -all
