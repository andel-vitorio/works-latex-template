# Projeto LaTeX - Template Estrutural

Este repositório contém um **template LaTeX** organizado para a criação de documentos de forma padronizada. O projeto inclui um `Makefile` que automatiza a criação de diretórios e a cópia de arquivos essenciais para começar um novo trabalho. 

## Estrutura do Projeto

A estrutura do projeto é composta pelos seguintes diretórios e arquivos:

```
meu_projeto_latex/
│
├── Appendixes/      # Diretório para apêndices
├── Chapters/        # Diretório para capítulos
├── Figures/         # Diretório para imagens e figuras
├── Logos/           # Diretório para logotipos (cópia de um diretório existente)
├── Pre-textual/     # Diretório para itens pré-textuais (cópia de um diretório existente)
├── main.tex         # Arquivo principal do documento LaTeX
├── reference.bib    # Arquivo de referências em formato BibTeX (criado vazio)
└── workconfig.sty   # Arquivo de configuração LaTeX (cópia do arquivo existente)
```

## Instruções de Uso

### Pré-requisitos

Antes de iniciar, certifique-se de ter o seguinte instalado:

- [LaTeX](https://www.latex-project.org/get/)
- [GNU Make](https://www.gnu.org/software/make/) (para automatizar o processo)
- [Tree](http://mama.indstate.edu/users/ice/tree/) (opcional, para visualizar a estrutura do diretório no terminal)

### Como Usar

1. **Clonar o repositório**:
   ```bash
   git clone https://github.com/usuario/projeto-latex.git
   cd projeto-latex
   ```

2. **Gerar a estrutura do projeto**:
   Execute o seguinte comando para criar os diretórios e arquivos dentro de uma nova pasta chamada `meu_projeto_latex`:

   ```bashw
   make all
   ```

   Esse comando cria os diretórios e copia os arquivos essenciais (`main.tex` e `workconfig.sty`) e as pastas (`Logos` e `Pre-textual`) com seus conteúdos.

3. **Limpar a estrutura do projeto**:
   Caso você deseje remover toda a estrutura criada, use o comando:

   ```bash
   make clean
   ```

### Personalização

Você pode personalizar o arquivo `workconfig.sty` para alterar as configurações globais do seu documento LaTeX. A estrutura de pastas também está pronta para adicionar apêndices, capítulos, figuras e outros conteúdos.

## Contribuição

Sinta-se à vontade para abrir _issues_ ou enviar _pull requests_ caso tenha sugestões de melhorias ou encontre problemas.

## Licença

Este projeto está licenciado sob os termos da [Licença MIT](LICENSE).