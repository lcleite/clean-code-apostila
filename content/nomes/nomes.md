# A Importância dos Nomes

#### {#intro} Introdução

Estamos constantemente nomeando ao desenvolver um software. 
Damos nomes para variáveis, funções, argumentos, classes, etc. 
Falaremos a seguir sobre a importância dos bons nomes e como eles influenciam positivamente no seu código.

#### {#nomes-sig} Utilizando Nomes Significativos

Primeiramente, devemos ter em mente o quão grande é a importância de nomear no desenvolvimento de software. 
Bons nomes podem economizar muito tempo na leitura do seu código, e é por isso que você pode gastar sem problemas um tempinho a mais
para garantir que está nomeando da melhor maneira possível. 

{% label %}Exemplo de código{% endlabel %}
```java
List<int[]> lista = new ArrayList<>();
...
public List<int[]> obtem() {
    List<int[]> tmp = new ArrayList<>();
    for (int[] x : lista)
        if (x[0] == 4) tmp.add(x);
    return tmp;
}
```

O código acima não é complexo, é pequeno, mas ainda assim temos dificuldade em dizer o que ele está fazendo. O que é *lista* e o que estamos armazenando nela? Qual é a importância do primeiro elemento, zero, de um item da *lista*? O que significa o valor *4*? Como posso usar a *List<int[]>* que está sendo retornada?  
É muito difícil responder essas perguntas sem conhecimento prévio do ambiente em que o código acima está inserido. Está implícito que você
deve ter conhecimento prévio e isso é um problema, pois qualquer desenvolvedor deve entender claramente o seu código, não importa se é novo ou antigo em um projeto.

{% label %}Exemplo de código melhorado{% endlabel %}
```java
private final int STATUS = 0;
private final int STATUS_MARCADA = 4;
...
List<int[]> tabuleiroDoJogo = new ArrayList<>();
...
public List<int[]> obtemPecasMarcadas() {
    List<int[]> pecasMarcadas = new ArrayList<>();
    for (int[] peca : tabuleiroDoJogo)
        if (peca[STATUS] == STATUS_MARCADA)
            pecasMarcadas.add(peca);
    return pecasMarcadas;
}
```

O código melhorado não está limpo, mas elimina quase tudo que antes estava implícito. Com isso, é facil enxergar que o problema não está na
complexidade de um código, e sim na sua implicidade. Quanto mais coisas implícitas seu código possui, mais difícil é a sua leitura; seja
para qualquer outro desenvolvedor, ou para você mesmo - o próprio autor - um tempo depois.  

Falaremos sobre código limpo com mais detalhes ao longo da apostila, mas para efeito positivo (?), 


{% label %}Exemplo de código limpo{% endlabel %}
```java
...
List<Peca> tabuleiroDoJogo = new ArrayList<>();
...
public List<Peca> obtemPecasMarcadas() {
    List<Peca> pecasMarcadas = new ArrayList<>();

    for (Peca peca : tabuleiroDoJogo)
        if (peca.estaMarcada())
            pecasMarcadas.add(peca);
    return pecasMarcadas;
}
```