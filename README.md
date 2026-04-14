# 🎬 Netflix Data Analytics Project

## 📊 Overview
Este projeto simula um pipeline completo de dados, desde a ingestão até a visualização de insights, utilizando dados de avaliações de filmes.

O objetivo é analisar o comportamento dos usuários e a performance dos filmes.

---

## 🧠 Arquitetura

O projeto segue uma arquitetura em camadas:

- **RAW**: dados brutos ingeridos via CSV
- **DIM**: tabela dimensional de filmes
- **FACT**: tabela de avaliações dos usuários
- **VIEW**: camada analítica para consumo em BI

---

## 🛠️ Tecnologias

- Google Cloud Platform (BigQuery)
- SQL
- Metabase (via Docker)
- GitHub

---

## 📈 Análises Realizadas

- Evolução de avaliações ao longo do tempo
- Top 10 filmes mais bem avaliados
- Filmes mais populares (mais avaliados)
- Popularidade dos gêneros
- Relação entre popularidade e qualidade
- Atividade dos usuários

---

## 📊 Dashboard

O dashboard inclui:

- Heatmap de avaliações ao longo do tempo
- Ranking de filmes
- Análise de gêneros
- Scatter plots (popularidade vs qualidade)
- Atividade dos usuários

📌 *Adicione aqui prints do dashboard*

---

## 🚀 Insights

- Filmes populares nem sempre são os mais bem avaliados
- Alguns gêneros concentram maior volume de avaliações
- O comportamento dos usuários varia ao longo do tempo

---

## 📁 Estrutura do Projeto
sql/
raw/
analytical/
views/


---

## ⚠️ Observação

Os dados foram armazenados no Google Cloud (BigQuery) durante o desenvolvimento.
Os recursos foram desativados posteriormente para evitar custos.
