
# 2) Compile the half adder
# vcom -93 -work work full_adder.vhd
# vcom -93 -work work cl_adder.vhd

# 3) Load it for simulation
vsim cl_adder

# 4) Open some selected windows for viewing
 view structure
view signals
view wave

# 5) Show some of the signals in the wave window
add wave A
add wave B
add wave Cin
add wave S
add wave Cout

# 6) Set some test patterns
##############################
force Cin 0 0
force -deposit A 0000 0
force -deposit  B 0000 0

force -deposit B 0001 10

force -deposit B 0010 20

force -deposit  B 0011 30

force -deposit  B 0100 40

force -deposit  B 1001 50

 #############################
force -deposit A 0010 60
force -deposit B 0111 60

#### extreme case ################
force -deposit Cin 1 70 
force -deposit B 1111 70
force -deposit A 1111 70



run 100