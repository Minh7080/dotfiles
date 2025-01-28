#!/bin/bash
input=$1
name=${input::-2}
gcc $input -o $name 
./$name
