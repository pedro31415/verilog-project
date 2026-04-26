#!/bin/bash

echo "Limpando arquivos antigos..."
rm -f sim.out wave/output.vcd

echo "Compilando..."
iverilog -o sim.out src/*.v sim/system_tb.v

if [ $? -ne 0 ]; then
  echo "Erro na compilação"
  exit 1
fi

echo "Rodando simulação..."
vvp sim.out

echo "Abrindo GTKWave..."
gtkwave wave/output.vcd &