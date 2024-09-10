# Nome do projeto (pasta principal onde será criada a estrutura)
PROJECT_NAME = meu_projeto_latex

# Diretórios que serão criados dentro da pasta do projeto (sem Logos e Pre-textual)
DIRECTORIES = Appendixes Chapters Figures

# Pastas que serão copiadas com seus conteúdos
FOLDERS_TO_COPY = Logos Pre-textual

# Arquivos que serão copiados para dentro da pasta do projeto
FILES_TO_COPY = main.tex workconfig.sty

# Arquivos que serão criados vazios
EMPTY_FILES = reference.bib

# Comando para criar a pasta do projeto
create_project_dir:
	@echo "Criando diretório do projeto: $(PROJECT_NAME)"
	@mkdir -p $(PROJECT_NAME)

# Comando para criar os diretórios dentro da pasta do projeto
create_dirs: create_project_dir
	@echo "Criando diretórios dentro de $(PROJECT_NAME)..."
	@mkdir -p $(addprefix $(PROJECT_NAME)/, $(DIRECTORIES))
	@echo "Diretórios criados: $(DIRECTORIES)"

# Comando para copiar arquivos existentes
copy_files: create_project_dir
	@echo "Copiando arquivos..."
	@cp $(FILES_TO_COPY) $(PROJECT_NAME)/
	@echo "Arquivos copiados: $(FILES_TO_COPY)"

# Comando para copiar pastas com seus conteúdos
copy_folders: create_project_dir
	@echo "Copiando pastas e seus conteúdos..."
	@cp -r $(FOLDERS_TO_COPY) $(PROJECT_NAME)/
	@echo "Pastas copiadas: $(FOLDERS_TO_COPY)"

# Comando para criar arquivos vazios
create_empty_files: create_project_dir
	@echo "Criando arquivos vazios..."
	@touch $(addprefix $(PROJECT_NAME)/, $(EMPTY_FILES))
	@echo "Arquivos vazios criados: $(EMPTY_FILES)"

# Comando para exibir a estrutura
show_structure:
	@echo "Estrutura do projeto $(PROJECT_NAME):"
	@tree $(PROJECT_NAME)

# Comando principal que cria tudo
all: create_dirs copy_files copy_folders create_empty_files show_structure
	@echo "Projeto $(PROJECT_NAME) criado com sucesso!"

# Limpar a pasta do projeto
clean:
	@echo "Limpando o projeto $(PROJECT_NAME)..."
	@rm -rf $(PROJECT_NAME)
	@echo "Projeto $(PROJECT_NAME) removido!"

# Alvo para ajuda
help:
	@echo "Makefile para gerar a estrutura do projeto LaTeX."
	@echo "Comandos disponíveis:"
	@echo "  make all         - Cria diretórios, copia arquivos e pastas na pasta $(PROJECT_NAME)"
	@echo "  make clean       - Remove a pasta $(PROJECT_NAME)"
	@echo "  make show_structure - Exibe a estrutura do projeto"
