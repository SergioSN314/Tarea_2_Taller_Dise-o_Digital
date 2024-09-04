transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/register.sv}
vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/mux_2_to_1.sv}
vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/comparator.sv}
vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/counter.sv}
vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/fsm.sv}
vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/mantenimiento.sv}

vlog -sv -work work +incdir+C:/Taller_Diseno_Digital/Tarea_2 {C:/Taller_Diseno_Digital/Tarea_2/mantenimmiento_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mantenimmiento_tb

add wave *
view structure
view signals
run -all
