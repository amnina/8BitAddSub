vsim ics_adder

view wave

add wave X
add wave Y
add wave Cin
add wave S
add wave Cout
add wave V

force Cin 0 0
force -deposit X 00000000 0
force -deposit Y 00000000 0

force -deposit Y 00000001 10

force -deposit Y 00000010 20

force -deposit  Y 00000011 30

force Y 00000100 40

force Y 00001001 50

 #############################
force -deposit X 00000010 60
force -deposit Y 00000111 60

force -deposit Cin 0 70 
force -deposit X 00001111 70
force -deposit Y 00001111 70

force X 11111111 80
force Y 11111111 80

force X 01111111 90
force Y 01111111 90

run 100