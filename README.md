# Projeto LaTeX - Template Estrutural

Este repositório contém um **template LaTeX** organizado para a criação de documentos de forma padronizada. O projeto inclui um `Makefile` que automatiza a criação de diretórios e a cópia de arquivos essenciais para começar um novo trabalho.

## Estrutura do Projeto

A estrutura do projeto é composta pelos seguintes diretórios e arquivos:

```
<PROJECT_NAME>/
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

2. **Gerar a Estrutura do Projeto**:
   Para criar a estrutura do projeto dentro de uma nova pasta chamada `<PROJECT_NAME>`, use o comando `make` com os seguintes parâmetros:

   ```bash
   make -C <TEMPLATE_DIR> PROJECT_NAME="<PROJECT_NAME>" TARGET_DIR=<TARGET_DIR>
   ```

   - `PROJECT_NAME="<PROJECT_NAME>"` define o nome da pasta do projeto.
   - `TARGET_DIR=<TARGET_DIR>` especifica o diretório onde o projeto será criado, relativo ao diretório onde o `make` é chamado. Por exemplo, `TARGET_DIR=..` cria o projeto no diretório pai do diretório atual.

   O comando `make` executa o alvo padrão `all`, que verifica se o projeto já existe. Se não existir, cria os diretórios e copia os arquivos essenciais (`main.tex` e `workconfig.sty`) e as pastas (`Logos` e `Pre-textual`) com seus conteúdos. Se o projeto já existir, apenas exibe uma mensagem e não realiza mais ações.

3. **Limpar a Estrutura do Projeto**:
   Caso você deseje remover toda a estrutura criada, use o comando:

   ```bash
   make -C <TEMPLATE_DIR> PROJECT_NAME="<PROJECT_NAME>" clean
   ```

### Personalização

Você pode personalizar o arquivo `workconfig.sty` para alterar as configurações globais do seu documento LaTeX. A estrutura de pastas também está pronta para adicionar apêndices, capítulos, figuras e outros conteúdos.

## Contribuição

Sinta-se à vontade para abrir _issues_ ou enviar _pull requests_ caso tenha sugestões de melhorias ou encontre problemas.

## Licença
