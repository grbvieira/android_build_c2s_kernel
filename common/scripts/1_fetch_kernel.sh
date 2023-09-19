#!/usr/bin/env bash

# fetch kernel sources
#git clone \
#  -b ${1:-master} \
#  https://github.com/grbvieira/kernel-N986B.git \
#  /home/noosreg/kernel


#!/bin/bash

# Defina a URL do repositório do GitHub
repo_url="https://github.com/grbvieira/kernel-N986B.git"

# Defina o diretório de destino para o repositório
dest_dir="/home/noosreg/kernel-N986B"

# Verifique se o diretório já existe
if [ -d "$dest_dir" ]; then
    # O diretório existe, então fazemos um git pull
    echo "O diretório já existe. Executando git pull..."
    cd "$dest_dir" || exit
    git pull
else
    # O diretório não existe, então fazemos um git clone
    echo "O diretório não existe. Executando git clone..."
    git clone "$repo_url" "$dest_dir"
fi

