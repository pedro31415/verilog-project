#!/bin/bash

echo "Gerando JSON compatível com DigitalJS..."

yosys -p "
read_verilog src/*.v
hierarchy -top system
proc
flatten
opt
techmap
opt
write_json synth/system.json
"

echo "JSON pronto em synth/system.json"