# 🐳 Instalação do Zabbix Server em Docker

Este projeto automatiza **toda a instalação do Docker** e a **implantação completa do Zabbix Server**, já com as configurações básicas prontas para uso imediato.  

Ideal para quem deseja subir rapidamente um ambiente funcional de **monitoramento com Zabbix**, sem precisar realizar configurações manuais.

---

## ⚙️ O que o script faz

- Instala o **Docker** e suas dependências  
- Faz o **download** dos arquivos `docker-compose.yml` e `.env` com todas as variáveis configuradas  
- Sobe o ambiente completo do **Zabbix Server + Banco de Dados PostgreSQL**  
- Prepara automaticamente o sistema para o **primeiro acesso**

---

## 🔐 Credenciais padrão

| Usuário | Senha |
|----------|--------|
| Admin    | admin  |

> ⚠️ **Recomenda-se alterar a senha após o primeiro login.**

---

## 🚀 Como executar
```
curl -sSL https://raw.githubusercontent.com/carlossilva-cybersec/HOME_LAB-PRO/scripts/Zabbix/setup_zabbix.sh | bash
```