#!/bin/bash
# ===============================================================
# SCRIPT DE AUTOMAÇÃO - INSTALAÇÃO DO ZABBIX VIA DOCKER
# Autor: Carlos Silva (carlossilva_cybersec)
# Data: 14/02/2026
# Descrição: Instala Docker, baixa o ambiente Zabbix e sobe os containers
# ===============================================================

set -e  # encerra o script se qualquer comando falhar
set -u  # encerra se alguma variável não inicializada for usada

# -------------------------------
# 1. Checagem de privilégios
# -------------------------------
if [[ $EUID -ne 0 ]]; then
  echo "❌ Este script precisa ser executado como root."
  echo "Use: sudo $0"
  exit 1
fi

# -------------------------------
# 2. Atualização e pacotes básicos
# -------------------------------
echo "🔄 Atualizando pacotes e instalando dependências..."
apt update -y && apt install -y git curl wget

# -------------------------------
# 3. Instalação do Docker (caso não exista)
# -------------------------------
if ! command -v docker &> /dev/null; then
  echo "🐳 Instalando Docker..."
  curl -fsSL https://get.docker.com | bash
else
  echo "✅ Docker já está instalado."
fi

# -------------------------------
# 4. Criação do diretório e download dos arquivos
# -------------------------------
ZABBIX_DIR="/opt/zabbix"
REPO_BASE="https://raw.githubusercontent.com/carlossilva-cybersec/HOME_LAB-PRO/refs/heads/main/scripts/Zabbix/"

echo "📂 Criando diretório do Zabbix em $ZABBIX_DIR ..."
mkdir -p "$ZABBIX_DIR"
cd "$ZABBIX_DIR"

echo "⬇️ Baixando arquivos do repositório..."
wget -q "$REPO_BASE/docker-compose.yml" -O docker-compose.yml
wget -q "$REPO_BASE/.env" -O .env

# -------------------------------
# 5. Subindo os containers
# -------------------------------
echo "🚀 Iniciando containers com Docker Compose..."
docker compose up -d

# -------------------------------
# 6. Status final
# -------------------------------
echo
echo "✅ Instalação concluída com sucesso!"
echo "📡 Acesse o painel do Zabbix conforme definido no arquivo .env."
echo "🔍 Para verificar os containers, use: docker ps"
echo
