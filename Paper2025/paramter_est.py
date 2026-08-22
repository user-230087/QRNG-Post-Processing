import math 
import numpy as np 

block_size = 1000                        # number of bits to be processed in each of the blocks
no_of_blocks = 40                        # total number of blocks 
batch_size = block_size * no_of_blocks   # number of bits processed in each cycle 

clock_speed = 200                 # in MHz 
extraction_ratio = 0.8           #extraction ratio
m = extraction_ratio*block_size   # for each block 

input_string = 8e5  #size of input bitsstring 
number_of_batches = input_string / batch_size 

number_of_cycles = (number_of_batches * m) + 21

speed = (input_string*clock_speed*0.001)/number_of_cycles 
print("Number of cycles:   ", number_of_cycles)
print("Speed is:   ", speed)