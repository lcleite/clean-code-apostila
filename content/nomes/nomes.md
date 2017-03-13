# A Importância dos Nomes

#### {#intro} Introdução

Estamos constantemente nomeando ao desenvolver um software. 
Damos nomes para variáveis, funções, argumentos, classes, etc. 
Falaremos a seguir sobre a importância dos bons nomes e como eles influenciam positivamente no seu código.

#### {#nomes-sig} Utilizando Nomes Significativos

Primeiramente, devemos ter em mente o quão grande é a importância de nomear no desenvolvimento de software. 
Bons nomes podem economizar muito tempo na leitura do seu código, e é por isso que você pode gastar sem problemas um tempinho a mais
para garantir que está nomeando da melhor maneira possível. 

{% label %}Exemplo Java{% endlabel %}
```java
public List<int[]> obtem() {
    List<int[]> tmp = new ArrayList<>();
    for (int[] x : theList)
        if (x[0] == 4) tmp.add(x);
    return tmp;
}
```