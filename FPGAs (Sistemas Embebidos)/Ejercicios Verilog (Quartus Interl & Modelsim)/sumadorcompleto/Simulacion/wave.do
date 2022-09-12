onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sumadorcompleto/Cin
add wave -noupdate /sumadorcompleto/A
add wave -noupdate /sumadorcompleto/B
add wave -noupdate /sumadorcompleto/s
add wave -noupdate /sumadorcompleto/Cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {234 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {50 ps} {1009 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/sumadorcompleto/Cin 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/sumadorcompleto/A 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/sumadorcompleto/B 
WaveCollapseAll -1
wave clipboard restore
