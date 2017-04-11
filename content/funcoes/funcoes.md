# A Essência do Código Limpo Está nas Funções

#### {#intro} Introdução

Na maior parte do tempo que desenvolvemos, estamos escrevendo funções. Nossos sistemas são formados, basicamente, por conjuntos de porções de código. Se desejamos escrever um código limpo, temos que dar uma atenção especial às nossas sub-rotinas.

#### {#pequena} P-E-Q-U-E-N-A

Vamos começar com um exemplo de uma função grande. Leia totalmente, linha após linha, e tente dizer o que essa função faz.

{% label %}Exemplo de função grande{% endlabel %}
```java
public static String criaWiki(DisciplinaData disciplinaData, boolean existeTurmaAtual){
    PaginaWiki paginaWiki = new PaginaWiki();
    StringBuffer buffer = new StringBuffer();
    if(disciplinaData.getTopicos() != null){
        List<String> topicos = disciplinaData.getTopicos();
        SecaoWiki tmp = SecaoWikiFactory.criar("Tópicos", topicos);
        paginaWiki.addSecao(tmp);
        if(existeTurmaAtual){
            if (disciplinaData.getTurma() != null){
                List<Aluno> alunos = disciplinaData.getTurma();
                List<String> alunos2 = new ArrayList<>();
                for(Aluno a : alunos){
                    String s = a.getNome() + " - " + a.getMatricula();
                    alunos2.add(s);
                }
                tmp = SecaoWikiFactory.criar("Alunos", alunos2);
                paginaWiki.addSecao(tmp);
            }
            if(disciplinaData.getCronograma() != null){
                List<Atividade> cronograma = disciplinaData.getCronograma();
                List<String> cronograma2 = new ArrayList<>();
                for(Atividade a : cronograma){
                    String s = a.getData() + " - " + a.getTitulo();
                    cronograma2.add(s);
                }
                tmp = SecaoWikiFactory.criar("Cronograma", cronograma2);
                paginaWiki.addSecao(tmp);
            }
        }
    }
    for(SecaoWiki s : paginaWiki.getSecoes()){
        buffer.append(s.getHtml());
    }
    return buffer.toString();
}
```

{% label %}Exemplo de função reduzidaa{% endlabel %}
```java
public static String criaWikiDisciplina(Disciplina disciplina){
    PaginaWikiDisciplina paginaWikiDisciplina = new PaginaWikiDisciplina();
    boolean possuiTurmaAtiva = disciplina.possuiTurmaAtiva();

    if(disciplina.possuiTopicos()){
        adicionaTopicosNaWiki(paginaWikiDisciplina, disciplina);
        adicionaTurmaNaWiki(paginaWikiDisciplina, disciplina, possuiTurmaAtiva);
        adicionaCronogramaNaWiki(paginaWikiDisciplina, disciplina, possuiTurmaAtiva);
    }

    return paginaWikiDisciplina.getHtml();
}
```
