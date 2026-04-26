# Projeto: Sistema Digital de 3 Bits (Incremento/Decremento)

Este projeto implementa um sistema digital utilizando Verilog que realiza operações de incremento e decremento em um registrador de 3 bits, com suporte a números negativos utilizando complemento de 2.

---

# Objetivo

Desenvolver e simular um sistema composto por:

* Meio somador
* Somador completo
* Somador de 3 bits
* Registrador de 3 bits
* Sistema completo com controle de incremento/decremento

---

# Funcionamento do Sistema

O sistema funciona com base em um registrador de 3 bits que armazena o valor atual (`q[2:0]`).

A cada borda de subida do clock:

* Se `up_down = 0` → Incrementa (+1)
* Se `up_down = 1` → Decrementa (-1)

O valor é atualizado e realimentado (feedback), formando um contador.

---

## Representação (Complemento de 2)

| Binário | Decimal |
| ------- | ------- |
| 000     | 0       |
| 001     | 1       |
| 010     | 2       |
| 011     | 3       |
| 100     | -4      |
| 101     | -3      |
| 110     | -2      |
| 111     | -1      |

---

# Estrutura do Projeto

```
verilog-project/
├── src/        # Módulos Verilog
├── sim/        # Testbench
├── wave/       # Arquivos de waveform (.vcd)
├── synth/      # Arquivos gerados pelo Yosys
├── run.sh      # Script de simulação
├── synth.sh    # Script de síntese
```

---

# Como executar o projeto

##  1. Instalar dependências

No WSL (Ubuntu):

```bash
sudo apt update
sudo apt install iverilog gtkwave yosys -y
```

---

##  2. Rodar simulação

```bash
./run.sh
```

### O que esse script faz:

* Compila os arquivos Verilog com `iverilog`
* Executa a simulação
* Gera arquivo `.vcd` (waveform)
* Abre no GTKWave

---

##  3. Visualizar ondas

No GTKWave:

* Adicione sinais:

  * `clk`
  * `reset`
  * `up_down`
  * `q[2:0]`

* Observe as transições a cada borda de subida do clock

---

# Síntese do circuito (Yosys)

## Gerar netlist em JSON

```bash
./synth.sh
```

### O que esse script faz:

* Lê os arquivos Verilog
* Prepara o circuito
* Aplica otimizações
* Gera arquivo:

```
synth/system.json
```

---

# Visualização no DigitalJS

1. Acesse:
   https://digitaljs.tilk.eu/

2. Importe o arquivo:

```
synth/system.json
```

Observação:
Circuitos grandes podem ficar visualmente complexos.

---

# Fluxo completo

```
Verilog → Simulação (Icarus) → Waveform (GTKWave)
        → Síntese (Yosys) → Visualização (DigitalJS)
```

---

# Observações importantes

* O sistema utiliza complemento de 2 para representar números negativos
* O overflow ocorre naturalmente:

  * 3 → -4
* O underflow:

  * -4 → 3
* Todo o sistema é síncrono (controlado por clock)

---

#  Tecnologias utilizadas

* Verilog
* Icarus Verilog
* GTKWave
* Yosys
* DigitalJS

---

# Autor

Projeto desenvolvido para fins acadêmicos com foco em sistemas digitais e lógica combinacional/sequencial.
