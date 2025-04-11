#!/usr/bin/env tclsh

# Sample Tcl script for testing encryption
proc hello_world {} {
    puts "Hello, World! This is a sample Tcl script."
    puts "This script will be encrypted to TBC format."
}

proc calculate_sum {a b} {
    return [expr $a + $b]
}

# Main execution
hello_world
puts "Sum of 5 and 7 is: [calculate_sum 5 7]"
