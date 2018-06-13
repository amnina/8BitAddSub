view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 100ns sim:/ics_adder/X 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00000001 -range 7 0 -starttime 0ns -endtime 100ns sim:/ics_adder/Y 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 100ns sim:/ics_adder/Cin 
wave modify -driver freeze -pattern constant -value 00000010 -range 7 0 -starttime 100ns -endtime 200ns Edit:/ics_adder/X 
wave edit invert -start 10000ps -end 20000ps Edit:/ics_adder/Y(0) 
wave modify -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 1000ns Edit:/ics_adder/X 
wave modify -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 1000ns Edit:/ics_adder/Y 
wave edit invert -start 50000ps -end 100000ps Edit:/ics_adder/Y(0) 
wave edit invert -start 100000ps -end 150000ps Edit:/ics_adder/Y(1) 
wave edit invert -start 150000ps -end 200000ps Edit:/ics_adder/Y(2) 
WaveCollapseAll -1
wave clipboard restore
