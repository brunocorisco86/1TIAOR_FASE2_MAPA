# 1TIAOR_FASE2_MAPA - FASE2 - CAP1
repositório para enviar o MER e DER da atividade O MAPA DO TESOURO

## Conteúdo:
- README.md
- MODELO.sql
- MODELO.png
- PARTICIPANTES.pdf
- ORACLE (pasta) 
  |__MODELO
  |__MODELO.dmd

## Descrição do Banco de Dados

O projeto consiste em um modelo de dados para gerenciar informações de produtores, plantações, sensores e ajustes de aplicações de água e nutrientes, utilizados pela startup fictícia *FarmTech Solutions*. A modelagem foi realizada no Oracle SQL Developer Data Modeler e inclui a criação de tabelas, relacionamentos e regras de integridade.

## Estrutura do Banco de Dados

### Tabelas e Atributos

1. **ajuste_aplicacao**: Armazena os ajustes feitos nas aplicações de água e nutrientes.
   - `id_ajuste` (INTEGER): Identificador único do ajuste (**PK**).
   - `id_produtor` (INTEGER): Identificador do produtor (**FK**).
   - `tp_ajuste` (VARCHAR2(30)): Tipo do ajuste realizado ("Irrigação" ou "Nutriente").
   - `dh_ajuste` (TIMESTAMP): Data e hora do ajuste.
   - `vl_ajustado` (NUMBER): Valor ajustado de água ou nutriente.
   - **Constraints**:
     - `ck_aj_aplic_ajuste`: `vl_ajustado` deve ser maior que 0.
     - `ck_aj_aplic_tipo_ajuste`: `tp_ajuste` deve ser "Irrigação" ou "Nutriente".

2. **cultura**: Armazena informações das culturas plantadas.
   - `id_cultura` (INTEGER): Identificador único da cultura (**PK**).
   - `id_produtor` (INTEGER): Identificador do produtor (**FK**).
   - `id_plantacao` (INTEGER): Identificador da plantação (**FK**).
   - `id_leitura` (INTEGER): Identificador da leitura (**FK**).
   - `nm_cultura` (VARCHAR2(255)): Nome da cultura.
   - `dt_inicio_plantio` (TIMESTAMP): Data de início do plantio.
   - `dt_fim_plantio` (TIMESTAMP): Data de fim do plantio.
   - `dt_colheita` (DATE): Data de colheita.
   - **Constraints**:
     - `ck_cultura_data`: `dt_inicio_plantio` deve ser menor que `dt_colheita`.

3. **leitura_sensor**: Armazena as leituras dos sensores.
   - `id_leitura` (INTEGER): Identificador único da leitura (**PK**).
   - `id_sensor` (INTEGER): Identificador do sensor (**FK**).
   - `dh_inicio_leitura` (TIMESTAMP): Data e hora de início da leitura.
   - `dh_leitura_fim` (TIMESTAMP): Data e hora de fim da leitura.
   - `vl_referencia` (NUMBER): Valor da leitura.
   - **Constraints**:
     - `ck_leitura_sensor_valor`: `vl_referencia` deve ser maior que 0.

4. **plantacao**: Armazena informações sobre as plantações.
   - `id_plantacao` (INTEGER): Identificador único da plantação (**PK**).
   - `id_sensor` (INTEGER): Identificador do sensor (**FK**).
   - `nu_area_plantacao` (NUMBER): Área da plantação.
   - `nu_coordenadas_plantacao_wkt` (VARCHAR2(125)): Coordenadas da plantação em formato WKT.
   - **Constraints**:
     - `ck_plantacao_area`: `nu_area_plantacao` deve ser maior que 0.

5. **produtor**: Armazena informações dos produtores.
   - `id_produtor` (INTEGER): Identificador único do produtor (**PK**).
   - `nm_produtor` (VARCHAR2(255)): Nome do produtor.
   - `nu_telefone` (VARCHAR2(11)): Número de telefone.
   - `ds_endereco` (VARCHAR2(255)): Endereço.
   - `nu_cpf_produtor` (CHAR(11)): CPF do produtor.
   - `dt_nascimento` (DATE): Data de nascimento.
   - `ic_ativo` (INTEGER): Indicador de ativo.

6. **sensor**: Armazena informações dos sensores utilizados.
   - `id_sensor` (INTEGER): Identificador único do sensor (**PK**).
   - `tp_sensor` (VARCHAR2(100)): Tipo de sensor ("S1", "S2", "S3").
   - `ds_modelo_sensor` (VARCHAR2(100)): Modelo do sensor.
   - `nu_ano_fabricacao` (INTEGER): Ano de fabricação do sensor.
   - `ds_fabricante_sensor` (VARCHAR2(100)): Fabricante do sensor.
   - **Constraints**:
     - `ck_sensor_1`: `tp_sensor` deve ser "S1", "S2" ou "S3".

### Relacionamentos e Integridade Referencial

- `ajuste_aplicacao` possui um relacionamento com `produtor`:
  - `fk_ajuste_aplicacao_produtor`: `id_produtor` refere-se a `produtor.id_produtor`.
- `cultura` possui relacionamentos com `leitura_sensor`, `plantacao` e `produtor`:
  - `fk_cultura_leitura_sensor`: `id_leitura` refere-se a `leitura_sensor.id_leitura`.
  - `fk_cultura_plantacao`: `id_plantacao` refere-se a `plantacao.id_plantacao`.
  - `fk_cultura_produtor`: `id_produtor` refere-se a `produtor.id_produtor`.
- `leitura_sensor` possui um relacionamento com `sensor`:
  - `fk_leitura_sensor_sensor`: `id_sensor` refere-se a `sensor.id_sensor`.
- `plantacao` possui um relacionamento com `sensor`:
  - `fk_plantacao_sensor`: `id_sensor` refere-se a `sensor.id_sensor`.
