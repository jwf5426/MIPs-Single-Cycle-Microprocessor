proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {D:/Users/James/Box Sync/School/CMPEN 331/frazier_lab7/frazier_lab.cache/wt} [current_project]
  set_property parent.project_path {D:/Users/James/Box Sync/School/CMPEN 331/frazier_lab7/frazier_lab.xpr} [current_project]
  set_property ip_cache_permissions disable [current_project]
  add_files -quiet {{D:/Users/James/Box Sync/School/CMPEN 331/frazier_lab7/frazier_lab.runs/synth_1/CPU.dcp}}
  read_xdc {{D:/Users/James/Box Sync/School/CMPEN 331/frazier_lab7/frazier_lab.srcs/constrs_1/new/TimeConstraint.xdc}}
  link_design -top CPU -part xc7z010clg400-1
  write_hwdef -file CPU.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force CPU_placed.dcp
  report_io -file CPU_io_placed.rpt
  report_utilization -file CPU_utilization_placed.rpt -pb CPU_utilization_placed.pb
  report_control_sets -verbose -file CPU_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force CPU_routed.dcp
  report_drc -file CPU_drc_routed.rpt -pb CPU_drc_routed.pb -rpx CPU_drc_routed.rpx
  report_methodology -file CPU_methodology_drc_routed.rpt -rpx CPU_methodology_drc_routed.rpx
  report_timing_summary -warn_on_violation -max_paths 10 -file CPU_timing_summary_routed.rpt -rpx CPU_timing_summary_routed.rpx
  report_power -file CPU_power_routed.rpt -pb CPU_power_summary_routed.pb -rpx CPU_power_routed.rpx
  report_route_status -file CPU_route_status.rpt -pb CPU_route_status.pb
  report_clock_utilization -file CPU_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force CPU_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

