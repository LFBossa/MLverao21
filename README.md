# MLverao21
Repositório feito para agregar os arquivos de projetos do curso de verão 2021 promovido pelo GEAM UFSC. 

Projeto executado pelos alunos Luiz Fernando Bossa e João Vitor Pamplona.

## Objetivo

Nosso objetivo é tentar prever resultados de partidas de futebol do campeonato brasileiro, série A. 

Podemos modelar esse problema como um problema de classificação multiclasse, na qual os resultados possíveis são

- Classe 1: vitória do time mandante
- Classe 0: empate
- Classe -1: vitória do time visitante

Para tal previsão, usaremos as seguintes _features_:

- Rodada em que a partida é realizada
- Ranking CBF dos times 
- Número de pontos dos times antes da partida
- Saldo de gols dos times antes da partida

O ranking CBF sofreu uma revisão em sua metodologia a partir de 2013, motivo pelo qual utilizamos os dados do seguinte repositório [Brasileirao_Dataset](https://github.com/adaoduque/Brasileirao_Dataset) a partir de 2013.

Como o dataset acima só vai até o ano de 2019, utilizamos dados do site da CBF para preencher os jogos de 2020. Essa parte foi feita semi-manualmente, uma vez que os dados estavam em formato tabelado dentro de um arquivo PDF. 

Optamos por utilizar o algoritmo das _Support Vector Machines_, com o método de classificação _One vs All_. Conforme mostrado no notebook [Comparações](Comparações.ipynb), obtivemos resultados significativamente melhores do que um classificador aleatório. 

Criamos um classificador para cada ano do campeonato, e as predições para os próximos jogos foram feitas em modo de "voto da maioria"
 
 - Calculamos a tabela do campeonato até o presente momento para ter o saldo de pontos e gols para cada time.
 - Aplicamos os dados de cada partida futura em cada um dos classificadores. O resultado mais frequente foi o escolhido.
 - Uma vez com o resultado em mãos, utilizamos uma função que gera um saldo de gols aleatório para atualizar a tabela do campeonato.

Os resultados obtidos foram cristalizados no arquivo [previsões.html](previsões.html).


