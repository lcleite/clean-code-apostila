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
complexidade de um código, e sim na quantidade de coisas implícitas. Quanto mais coisas implícitas seu código possui, mais difícil é a sua leitura; seja para qualquer outro desenvolvedor, ou para você mesmo - o próprio autor - um tempo depois.  

Falaremos sobre código limpo com mais detalhes ao longo da apostila, mas para começarmos a desenvolver um olhar crítico sobre o nosso próprio código, segue um exemplo de código limpo. 

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

#### {#confusoes} Evite Confusões

Como desenvolvedores, não queremos dar falsas pistas sobre o entendimento do nosso código.
Alguns nomes de variáveis podem mascarar ou até indicar uma ideia diferente da rotina escrita para outro desenvolvedor que está lendo. 

{% label %}Exemplo de nomes confusos{% endlabel %}
```java
...
private String rm, cd, ls;
private int nulo = -1;
...
```

As variáveis *rm*, *cd* e *ls* têm nomes de comandos Unix amplamente usados e para o código desenvolvido, são nomes curtos e sem significado algum. A tendência é que, por esse motivo, o desenvolvedor que está lendo o código associe automaticamente o propósito dessas variáveis no código com a funcionalidade desses comandos conhecidos.

O caso da variável *nulo* é simplesmente visual. As palavras *nulo* e *null* são muito parecidas, diferenciadas apenas pela sua última letra. Constantemente quando estamos lendo, não lemos uma palavra inteira e a proximidade entre o nome da variável e a palavra protegida *null* pode causar desentendimento no nosso código.

Para enfatizar que não lemos uma palavra letra por letra, vamos observar o exemplo abaixo.

{% label %}Exemplo de nomes similares{% endlabel %}
```java
class PROConversorDeObjetoSeralizadoEmXmlParaString { ... }
...
class PROConversorDeObjetoSeralizadoEmJsonParaString { ... }
```

Os nomes das duas classes acima são muito parecidos e difíceis de diferenciar até em uma leitura simples como no exemplo, podemos imaginar o quanto piora em um código real.

Existem casos que levam os desenvolvedores a entender de outra forma o funcionamento de certas variáveis por causa da nomenclatura utilizada.
No exemplo abaixo, a variável *nomesList* pode sugerir um comportamento diferente da sua declaração.

{% label %}Exemplo de confusão de tipo{% endlabel %}
```java
...
private String[] nomesList;
...
```

Ao ler a palavra *List* em *nomesList*, imediatamente associamos essa variável a alguma implementação da interface List. O ideal é não utilizar tipos ao nomear uma variável a não ser que seja bem necessário e útil, como é o caso das instâncias de *View* no desenvolvimento mobile. Nesse caso, utilizar simplesmente *nomes* seria bom; melhor ainda seria algo mais explícito como *nomesDosAlunos*.

#### {#diff} Diferenças Significativas

Vamos começar com um exemplo simples, uma função que copia dois vetores de char.

{% label %}Exemplo de argumentos confusos{% endlabel %}
```java
public static void copiarChars(char[] c1, char[] c2) {
    ...
}
```

Nossa primeira dúvida ao olhar essa função é saber quem é o vetor base e quem é o destino da função. Em seguida, tentamos fazer atribuições sem certeza, pensando que o padrão foi seguido e o primeiro argumento é a base e o segundo é o destino. O último passo é assumir a insegurança e parar o fluxo do nosso trabalho só para testar o comportamento dessa função.

{% label %}Exemplo de argumentos significativos{% endlabel %}
```java
public static void copiarChars(char[] base, char[] destino) {
    ...
}
```

Com a função escrita da maneira acima, com certeza não perderíamos tempo questionando o comportamento da função e, muito menos, pararíamos nosso fluxo de trabalho para realizar testes que não agregam valor ao nosso sistema.

É comum que determinadas funções tenham comportamento semelhante no nosso código. Sempre que isso acontecer, devemos ter o trabalho de indicar aos outros desenvolvedores a utilização certa e a diferença entre essas rotinas.

{% label %}Exemplo de funções confusas{% endlabel %}
```java
obtemContas();
obtemContasAtivas(); 
obtemContaAtiva(); 
obtemInfoDeContaAtiva();
```

O fato dos escopos das funções estarem reduzidos e os retornos omitidos no código acima, isso não possui uma relevância tão significativa assim. O que realmente importa é que embora tenhamos nomes diferentes nas quatro funções e, ainda assim, não temos de fato uma diferença de sentido entre elas. É como nomear duas classes, uma chamada *ContaInfo* e outra *ContaDado*; ambas possuem nomes diferentes, mas qual seria a diferença prática? 

Caso você não tenha se convencido ainda por causa da falta de retorno das funções no exemplo acima, deve lembrar que no meio do código não teremos sempre o escopo disponível e teríamos que toda hora consultar sua declaração. Mesmo que as IDEs ajudem nessa consulta, é improdutivo ter fazer isso várias vezes ao longo do desenvolvimento, principalmente se a definição real está em outra camada do sistema.

#### {#abrv} Não Use Abreviações

Abreviar nomes contribui para o aumento de coisas implícitas no código e que necessitam de conhecimento prévio do leitor para que haja um perfeito entendimento.

{% label %}Exemplo de código implícito com abreviações{% endlabel %}
```java
public class Documento{
    private Date cDtMdhms;
    private Date mDtMdhms;
    ...
}
```

O que podemos dizer sobre as variáveis *cDtMdhms* e *mDtMdhms*? Como podemos pronunciar os seus nomes para qualquer tipo de discussão sobre esse código?

{% label %}Exemplo de código melhorado{% endlabel %}
```java
class DocumentoInscricao{
    private Date criacaoTimestamp;
    private Date ultimaModificacaoTimestamp;
    ...
}
```

Agora ficou muito mais fácil de entender, mesmo sem conhecimento prévio do sistema, que existe uma classe *DocumentoInscricao* relativa a algum documento de inscrição e que esse documento possui um carimbo de data de criação e da sua última modificação. Isso tudo foi possível apenas nomeando de maneira correta e significativa, tornando explícito qualquer sentido antes escondido.




