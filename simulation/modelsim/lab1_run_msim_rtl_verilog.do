transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/bcd_counter.v}
vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/SEG_HEX.v}
vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/edge_detect.v}
vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/lab1.v}
vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/mod_1sec.v}
vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/Clock_Counter.v}

vlog -vlog01compat -work work +incdir+D:/Digital_Logic_Design/Pratice/Homework\ 1 {D:/Digital_Logic_Design/Pratice/Homework 1/lab1_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  lab1_tb

add wave *
view structure
view signals
run -all
