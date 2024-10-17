# FarmTech Solutions - Projeto de Banco de Dados

## 🌾 1TIAOR_FASE2_MAPA - FASE2 - CAP1

Repositório para o MER e DER da atividade "O MAPA DO TESOURO"

## 📁 Conteúdo do Repositório

- `README.md`: Este arquivo
- `MODELO.sql`: Script SQL do modelo
- `MODELO.png`: Imagem do modelo
- `PARTICIPANTES.pdf`: Lista de participantes do projeto
- `ORACLE/`: Pasta contendo arquivos do Oracle
  - `MODELO/`
  - `MODELO.dmd`

## 🏗️ Descrição do Projeto

Este projeto consiste em um modelo de dados desenvolvido para a startup fictícia *FarmTech Solutions*. O objetivo é gerenciar informações cruciais relacionadas a:

- Produtores agrícolas
- Plantações
- Sensores
- Ajustes de aplicações de água e nutrientes

A modelagem foi realizada utilizando o Oracle SQL Developer Data Modeler, abrangendo a criação de tabelas, estabelecimento de relacionamentos e definição de regras de integridade.

## 🗃️ Estrutura do Banco de Dados

### Tabelas Principais

1. **ajuste_aplicacao**
   - Registra ajustes nas aplicações de água e nutrientes
   - Chave Primária: `id_ajuste`
   - Chave Estrangeira: `id_produtor` (referencia `produtor`)

2. **cultura**
   - Armazena informações sobre as culturas plantadas
   - Chave Primária: `id_cultura`
   - Chaves Estrangeiras: 
     - `id_produtor` (referencia `produtor`)
     - `id_plantacao` (referencia `plantacao`)
     - `id_leitura` (referencia `leitura_sensor`)

3. **leitura_sensor**
   - Contém dados das leituras realizadas pelos sensores
   - Chave Primária: `id_leitura`
   - Chave Estrangeira: `id_sensor` (referencia `sensor`)

4. **plantacao**
   - Mantém informações sobre as áreas de plantio
   - Chave Primária: `id_plantacao`
   - Chave Estrangeira: `id_sensor` (referencia `sensor`)

5. **produtor**
   - Cadastro dos produtores agrícolas
   - Chave Primária: `id_produtor`

6. **sensor**
   - Detalhes dos sensores utilizados no campo
   - Chave Primária: `id_sensor`

### Principais Atributos e Constraints

#### ajuste_aplicacao
- `tp_ajuste`: "Irrigação" ou "Nutriente"
- `vl_ajustado`: Deve ser maior que 0

#### cultura
- `dt_inicio_plantio`: Deve ser anterior à `dt_colheita`

#### leitura_sensor
- `vl_referencia`: Deve ser maior que 0

#### plantacao
- `nu_area_plantacao`: Deve ser maior que 0

#### sensor
- `tp_sensor`: Deve ser "S1", "S2" ou "S3"

## 🔗 Relacionamentos e Integridade Referencial

O modelo garante a integridade referencial entre as tabelas, estabelecendo conexões lógicas entre:

- Produtores e seus ajustes de aplicação
- Culturas e suas respectivas leituras de sensores, plantações e produtores
- Leituras de sensores e os sensores correspondentes
- Plantações e os sensores associados

## 🛠️ Tecnologias Utilizadas

- Oracle SQL Developer Data Modeler

---

Para mais detalhes sobre a implementação ou dúvidas sobre o modelo, por favor, entre em contato com a equipe de desenvolvimento.
