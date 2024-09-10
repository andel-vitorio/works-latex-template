# Nome do projeto (pasta principal onde será criada a estrutura)
PROJECT_NAME ?= meu_projeto_latex

# Diretório onde o projeto será criado, relativo ao diretório onde o make é chamado
TARGET_DIR ?= $(CURDIR)

# Diretório onde o projeto será criado (o nome do projeto será adicionado a esse diretório)
PROJECT_PATH = $(TARGET_DIR)/$(PROJECT_NAME)

# Diretórios que serão criados dentro da pasta do projeto (sem Logos e Pre-textual)
DIRECTORIES = Appendixes Chapters Figures

# Pastas que serão copiadas com seus conteúdos
FOLDERS_TO_COPY = Logos Pre-textual

# Arquivos que serão copiados para dentro da pasta do projeto
FILES_TO_COPY = main.tex workconfig.sty

# Arquivos que serão criados vazios
EMPTY_FILES = reference.bib

# Regra para verificar se o projeto já existe
check_exists:
	@if [ -d "$(PROJECT_PATH)" ]; then \
		echo "O projeto $(PROJECT_PATH) já existe. Nada a fazer."; \
		exit 1; \
	fi

# Regra para criar o diretório do projeto
create_project_dir: check_exists
	@echo "Criando diretório do projeto em: $(PROJECT_PATH)"
	@mkdir -p $(PROJECT_PATH)

# Regra para criar diretórios dentro do projeto
create_dirs: create_project_dir
	@echo "Criando diretórios dentro de $(PROJECT_PATH)..."
	@mkdir -p $(addprefix $(PROJECT_PATH)/, $(DIRECTORIES))
	@echo "Diretórios criados: $(DIRECTORIES)"

# Regra para copiar arquivos existentes
copy_files: create_project_dir
	@echo "Copiando arquivos..."
	@for file in $(FILES_TO_COPY); do \
		if [ -f $$file ]; then \
			cp $$file $(PROJECT_PATH)/; \
			echo "Arquivo copiado: $$file"; \
		else \
			echo "Arquivo não encontrado: $$file"; \
		fi \
	done

# Regra para copiar pastas e seu conteúdo
copy_folders: create_project_dir
	@echo "Copiando pastas e seus conteúdos..."
	@for folder in $(FOLDERS_TO_COPY); do \
		if [ -d $$folder ]; then \
			cp -r $$folder $(PROJECT_PATH)/; \
			echo "Pasta copiada: $$folder"; \
		else \
			echo "Pasta não encontrada: $$folder"; \
		fi \
	done

# Regra para criar arquivos vazios
create_empty_files: create_project_dir
	@echo "Criando arquivos vazios..."
	@for file in $(EMPTY_FILES); do \
		touch $(PROJECT_PATH)/$$file; \
		echo "Arquivo vazio criado: $$file"; \
	done

# Regra para exibir a estrutura do projeto
show_structure:
	@echo "Estrutura do projeto $(PROJECT_NAME):"
	@ls -R $(PROJECT_PATH) || echo "Não foi possível listar o conteúdo do diretório."

# Regra principal que chama todas as outras regras
all: check_exists create_dirs copy_files copy_folders create_empty_files show_structure
	@echo "Projeto $(PROJECT_NAME) criado com sucesso!"

# Regra padrão que chama a regra `all`
.DEFAULT_GOAL := all

# Limpa a pasta do projeto
clean:
	@echo "Limpando o projeto $(PROJECT_PATH)..."
	@rm -rf $(PROJECT_PATH)
	@echo "Projeto $(PROJECT_PATH) removido!"

# Alvo para ajuda
help:
	@echo "Makefile para gerar a estrutura do projeto LaTeX."
	@echo "Comandos disponíveis:"
	@echo "  make              - Cria diretórios, copia arquivos e pastas na pasta $(PROJECT_NAME)"
	@echo "  make clean        - Remove a pasta $(PROJECT_NAME)"
	@echo "  make show_structure - Exibe a estrutura do projeto"
