## Sobre o conjunto de dados

No arquivo *tidy_data_set.txt* refere-se a um experimento [^1] em que 30 voluntários vestiam em sua cintura um smartphone Samsung Galaxy S II e realizavam atividades definidas aleatoriamente. O smartphone gerava dados através de seus sensores internos, acelerometro e giroscópio, além da váriavel de tempo. O experimento original gerou 561 vetores de recursos que abrangem tempo e frequência, além de algumas estimativas.

Para este projeto estou interessado apenas na medições que abrangem médias e desvio padrão.

No tópico Estrutura do conjunto de dados falarei sobre o que cada coluna do conjunto de dados significa e também indicarei algumas contagens sobre os dados. Em Variáveis Medidas haverá a composição do nome da variável, que indica descritivamente qual o sensor utilizado, o que ele mediu, em qual domínio e eixo. 
Em Referências indico o experimento que gerou o conjunto de dados original e algumas fontes que auxiliaram a sequência deste script.

> Informação importante: Por enquanto eu ainda não sou fluente na língua inglesa, por isso usarei o Google Tradutor como um auxiliador na tradução de Português do Brasil para Inglês. Peço desculpas por possíveis erros que possam atrapalhar na interpretação do texto

## Estrutura do conjunto de dados

Na tabela abaixo há a descrição de cada coluna do arquivo tidy_data_set.txt. 

|Número da Coluna|Nome da Coluna      |Tipo de Dado |Descrição dos registros                                     |
|----------------|--------------------|-------------|------------------------------------------------------------|
|1               |idSubject           | inteiro     |Código identificador do voluntário                          |
|2               |idActivity          | inteiro     |Código identificador da atividade realizada                 |
|3               |nameActivity        | string      |Nome da atividade realizada                                 |
|4               |variableMeasurement | string      |Nome da variável medida (mais detalhes em Variáveis Medidas)|
|5               |avgMeasuremente     | float       |Média das medições da váriavel                              |

- Este conjunto de dados possui 3,160 registros.
- Participaram do experimento original 30 voluntários
- Há 6 atividades (que foram distribuídas aleatoriamente entre os participantes) sendo elas walking, walking upstairs, walking downstairs, sitting, standing and laying.

## Trechos nos nomes das Medidas

Para auxiliar no entendimento da coluna `variableMeasurement` na tabela abaixo descrevemos o que cada trecho do nome significa:

|Texto|Descrição|
|------|---------|
|Frequence or Time| Refere-se ao domínio ao qual aquela medição representa|
|Gravity| Sinal do sensor do celular que mede a gravidade|
|Accelerometer| Sensor do celular que mede a aceleração|
|Gyroscope| Sensor do celular que mede a posição e direção do celular|
|Jerk| Derivação da aceleração linear do corpo e velocidade angular em relação ao tempo|


