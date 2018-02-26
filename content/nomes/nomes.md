# Código Limpo e a Importância de Nomear

#### Introdução

Estamos constantemente nomeando ao desenvolver um software.
Damos nomes para variáveis, funções, argumentos, classes, etc.
Falaremos a seguir sobre a importância dos bons nomes e como eles influenciam positivamente no seu código.

#### Utilizando Nomes Significativos

Primeiramente, devemos ter em mente o quão grande é a importância de nomear no desenvolvimento de software.
Bons nomes podem economizar muito tempo na leitura do seu código, e é por isso que você pode gastar sem problemas um tempinho a mais
para garantir que está nomeando da melhor maneira possível.

Exemplo de código
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

O código acima não é complexo, é pequeno, e ainda assim, temos dificuldade em dizer o que ele está fazendo. O que é *lista* e o que estamos armazenando nela? Qual é a importância do primeiro elemento, zero, de um item da *lista*? O que significa o valor *4*? Como posso usar a *List<int[]>* que está sendo retornada?  
É muito difícil responder essas perguntas sem conhecimento prévio do ambiente em que o código acima está inserido. Está implícito que você
deve ter conhecimento prévio e isso é um problema, pois qualquer desenvolvedor deve entender claramente o seu código, não importa se é novo ou antigo em um projeto.

Exemplo de código melhorado
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

O código melhorado não está limpo, mas elimina quase tudo que antes estava implícito. Com isso, é fácil enxergar que o problema não está na
complexidade de um código, e sim na quantidade de coisas implícitas. Quanto mais coisas implícitas seu código possui, mais difícil é a sua leitura; seja para qualquer outro desenvolvedor, ou para você mesmo – o próprio autor – um tempo depois.  

Podemos falar sobre código limpo com mais detalhes ao longo de outros posts, mas para começarmos a desenvolver um olhar crítico sobre o nosso próprio código, segue um exemplo de código limpo.

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

#### Evite Confusões

Como desenvolvedores, não queremos dar falsas pistas sobre o entendimento do nosso código.
Alguns nomes de variáveis podem mascarar ou até indicar uma ideia diferente da rotina escrita para outro desenvolvedor que está lendo.

Exemplo de nomes confusos
```java
...
private String rm, cd, ls;
private int nulo = -1;
...
```

As variáveis *rm*, *cd* e *ls* têm nomes de comandos Unix amplamente usados, entretanto para o código desenvolvido são nomes curtos e sem significado algum. A tendência é que, por esse motivo, o desenvolvedor que está lendo o código associe automaticamente o propósito dessas variáveis no código com a funcionalidade desses comandos conhecidos.

O caso da variável *nulo* é simplesmente visual. As palavras *nulo* e *null* são muito parecidas, diferenciadas apenas pela sua última letra. Constantemente quando estamos lendo, não lemos uma palavra inteira e a proximidade entre o nome da variável e a palavra protegida *null* pode causar desentendimento no nosso código.

Para enfatizar que não lemos uma palavra letra por letra, vamos observar o exemplo abaixo.

```java
class PROConversorDeObjetoSeralizadoEmXmlParaString { ... }
...
class PROConversorDeObjetoSeralizadoEmJsonParaString { ... }
```

Os nomes das duas classes acima são muito parecidos e difíceis de diferenciar até em uma leitura simples como no exemplo, podemos imaginar o quanto piora em um código real.

Existem casos que levam os desenvolvedores a entender de outra forma o funcionamento de certas variáveis por causa da nomenclatura utilizada.
No exemplo abaixo, a variável *nomesList* pode sugerir um comportamento diferente da sua declaração.

Exemplo de confusão de tipo
```java
...
private String[] nomesList;
...
```

Ao ler a palavra *List* em *nomesList*, imediatamente associamos essa variável a alguma implementação da interface List. O ideal é não utilizar tipos ao nomear uma variável a não ser que seja bem necessário e útil, como é o caso das instâncias de *View* no desenvolvimento mobile. Nesse caso, utilizar simplesmente *nomes* seria bom; melhor ainda seria algo mais explícito como *nomesDosAlunos*.

#### Diferenças Significativas

Vamos começar com um exemplo simples, uma função que copia dois vetores de char.

Exemplo de argumentos confusos
```java
public static void copia(char[] c1, char[] c2) {
    ...
}
```

Nossa primeira dúvida ao olhar essa função é saber quem é o vetor base e quem é o destino da função. Em seguida, tentamos fazer atribuições sem certeza, pensando que o padrão foi seguido e o primeiro argumento é a base e o segundo é o destino. O último passo é assumir a insegurança e parar o fluxo do nosso trabalho só para testar o comportamento dessa função.

Exemplo de argumentos significativos
```java
public static void copiaChars(char[] base, char[] destino) {
    ...
}
```

Com a função escrita da maneira acima, com certeza não perderíamos tempo questionando o comportamento da função e, muito menos, pararíamos nosso fluxo de trabalho para realizar testes que não agregam valor ao nosso sistema.

É comum que determinadas funções tenham comportamento semelhante no nosso código. Sempre que isso acontecer, devemos ter o trabalho de indicar aos outros desenvolvedores a utilização certa e a diferença entre essas rotinas.

Exemplo de funções confusas
```java
obtemContas();
obtemContasAtivas();
obtemContaAtiva();
obtemInfoDeContaAtiva();
```

O fato dos escopos das funções estarem reduzidos e os retornos omitidos no código acima não possui uma relevância tão significativa. O que realmente importa é que embora tenhamos nomes diferentes nas quatro funções, não temos de fato uma diferença de sentido entre elas. É como nomear duas classes, uma chamada *ContaInfo* e outra *ContaDado*; ambas possuem nomes diferentes, mas qual seria a diferença prática?

Caso você não tenha se convencido ainda por causa da falta de retorno das funções no exemplo acima, deve lembrar que no meio do código não teremos sempre o escopo disponível e teríamos que toda hora consultar sua declaração. Mesmo que as IDEs ajudem nessa consulta, é improdutivo ter fazer isso várias vezes ao longo do desenvolvimento, principalmente se a definição real está em outra camada do sistema.

#### Não Use Abreviações

Abreviar nomes contribui para o aumento de coisas implícitas no código que necessitam de conhecimento prévio do leitor para que haja um perfeito entendimento.

Exemplo de código implícito com abreviações
```java
public class Documento{
    private Long cDtMdhms;
    private Long mDtMdhms;
    ...
}
```

O que podemos dizer sobre as variáveis *cDtMdhms* e *mDtMdhms*? Como podemos pronunciar os seus nomes para qualquer tipo de discussão sobre esse código?

Exemplo de código melhorado
```java
class DocumentoInscricao{
    private Long criacaoTimestamp;
    private Long ultimaModificacaoTimestamp;
    ...
}
```

Agora ficou muito mais fácil de entender, mesmo sem conhecimento prévio do sistema, que existe uma classe *DocumentoInscricao* relativa a algum documento de inscrição e que esse documento possui um carimbo de data de criação e da sua última modificação. Isso tudo foi possível apenas nomeando de maneira correta e significativa, tornando explícito qualquer sentido antes escondido.

#### Prefixos e Sufixos

Antigamente, os compiladores não checavam os tipos das variáveis e os programadores precisavam lembrar constantemente do tipo das suas variáveis declaradas. Para ajudar, era muito comum nomear variáveis e utilizar como sufixo o seu tipo. Hoje em dia, existem diversas IDEs que podem nos ajudar com esse tipo de problema, então não vale a pena utilizar esse tipo de nomenclatura e correr o risco de prejudicar o nosso código.

Exemplo de nome inconsistente
```java
...
private NumeroTelefone telefoneString;
...
```

Certamente a variável correspondente a um número de telefone foi escrita inicialmente com o tipo String, porém – em algum momento – a mudança foi necessária e o nome permaneceu o mesmo, podendo causar confusão no código.

Outro ponto importante é que não precisamos de qualquer prefixo para diferenciar atributos da classe de outras variáveis. Prefixos como *m* só poluem o código e rapidamente aprendemos a ignorá-los, pois não trazem nenhum benefício, principalmente com o avanço das IDEs e suas diferentes cores que nos ajudam no desenvolvimento.

Exemplo de código bagunçado
```java
...
private ScrollListener mScrollListener;
...
```

Conforme aprendemos a ignorar o prefixo *m*, a leitura do código é prejudicada, já que a tendência é lermos *ScrollListener* tanto para a classe quanto para a variável.
Vale a pena ressaltar que nossas classes devem ser pequenas, então não vamos perder o controle de suas variáveis e nem dos seus tipos.

Existe um prefixo famoso para interfaces que nem sempre passa informação com clareza para os leitores do código. Por exemplo, o que podemos dizer sobre o nome *IAnimal*?
Até onde sabemos, esse prefixo com a letra *i* maiúscula pode significar *Interface* ou *Implementation*. Devemos evitar esse tipo de codificação, mas caso julgue necessário diferenciar
a interface da sua classe de implementação, utilize algum prefixo ou sufixo que não gere dúvidas e que seja escrito na classe de implementação; como por exemplo
*AnimalImpl*. É melhor deixar suas interfaces livres de codificação nos seus nomes, evitar distrações ou informações desnecessárias e não influenciar outros
desenvolvedores a criar um padrão de prefixo ou sufixo.

Outro problema com prefixos são os prefixos de projeto. Imagine um sistema chamado "Sistema de Gambiarras Predominantes", dado pela sigla SGP. Se começarmos a criar classes como
*SGPMensagem*, *SGPCliente*, *SGPRota* ... com o mesmo padrão de prefixo, nosso sistema fica poluído e vários efeitos negativos surgirão. Entre esses efeitos, podemos citar
a perda de produtividade ao usar uma das melhores funcionalidades de uma IDE, o *autocomplete*, simplesmente por adicionar às classes um prefixo que não agrega nenhum valor.
É bastante antiprodutivo termos que digitar sempre a sigla SGP para, então, localizar a classe que queremos utilizar. Vale também ressaltar o aumento da dificuldade de identificar
a classe que desejamos utilizar em uma lista em que a ordem alfabética é significativa somente a partir da quarta letra.

##### Exceção

Toda regra tem sua exceção. Existem casos onde sufixos são recomendados, já que facilitarão a vida do desenvolvedor que lerá o nosso código. Quando utilizamos algum
padrão de projeto, é muito mais fácil para o entendimento – e até construção – do código quando nomeamos interfaces ou classes com sufixos que representam um padrão.

Exemplo de nomenclatura para <i>design patterns</i>
```java
public interface CliqueListener { ... }

public interface FormasGeometricasFactory { ... }

public interface AlertaBuilder { ... }
```

Apenas lendo os nomes acima, conseguimos entender sem conhecimento prévio do sistema que existem três interfaces: uma que funciona como ouvinte de cliques, uma que funciona
como uma fábrica de formas geométricas e um construtor por etapas específicas de um alerta.

#### Seja Consistente

Devemos escolher um padrão para o nosso código e permanecer com ele ao longo de todo o nosso projeto. É prejudicial para o entendimento do nosso código quando utilizamos diferentes
nomenclaturas para ações semelhantes.

Exemplo de métodos inconsistente
```java
public String getNome() { ... }

public String recebeNome() { ... }

public String obtemNome() { ... }
```

Qual é a diferença entre os três métodos acima? O método *getNome()* pode fazer parte dos *getters e setters* da classe, mas e o *recebeNome()* e *obtemNome()*?
Qual é a diferença entre esses dois? Pior, pode ser que eles não tenham diferença alguma na sua funcionalidade. Seria melhor estabelecermos um padrão e utilizarmos consistentemente no nosso código.
Caso exista diferença entre os três métodos, podemos separá-los por classes e sempre utilizar a nomenclatura *get*.

Nosso padrão também deve ser aplicado nas classes que criamos.

Exemplo de classes inconsistente
```java
public class ProtocoloController { ... }

public class DispositivoManager { ... }
```

*Manager* e *Controller* são duas palavras genéricas no meio de desenvolvimento de sistemas. Nem sempre é trivial explicar o que um dos dois faz, e ter esses dois nomes juntos pode
complicar ainda mais, fazendo surgir dúvidas como "O que faz um Controller e um Manager?" ou "Por que as duas classes não são um Controller ou um Manager?".
