

# Descrição da Base de Dados do Diretório Pessoal

## Estrutura da Base de Dados

A base de dados do diretório pessoal foi projetada para armazenar informações sobre utilizadores, repositórios, branches, commits e issues, de forma semelhante ao GitHub. Eis a estrutura da base de dados:

### Tabela `Utilizadores`

- **UserID:** Identificador único do utilizador.
- **Nome:** Nome do utilizador.
- **Email:** Endereço de email do utilizador.
- **DataCriacao:** Data e hora de criação do registo do utilizador.

### Tabela `Repositórios`

- **RepoID:** Identificador único do repositório.
- **Nome:** Nome do repositório.
- **Descricao:** Descrição do repositório.
- **Linguagem:** Linguagem de programação principal do repositório.
- **UltimaAtualizacao:** Data e hora da última atualização do repositório.
- **CommitsCount:** Número total de commits no repositório.
- **UserID:** ID do utilizador que é o proprietário do repositório.

| Tabela       | Campos                      | Descrição                                                     |
|--------------|-----------------------------|---------------------------------------------------------------|
| Utilizadores | UserID, Nome, Email, DataCriacao | Armazena informações dos utilizadores.                       |
| Repositórios | RepoID, Nome, Descricao, Linguagem, UltimaAtualizacao, CommitsCount, UserID | Armazena informações dos repositórios. |
| Branches     | BranchID, Nome, RepoID      | Armazena informações dos branches dos repositórios.           |
| Commits      | CommitID, Mensagem, DataCommit, AutorID, BranchID | Armazena informações dos commits nos branches.         |
| Issues       | IssueID, Titulo, Descricao, Estado, RepoID, AutorID, DataCriacao | Armazena informações das issues nos repositórios. |
| Colaboradores | RepoID, UserID              | Tabela de associação entre utilizadores e repositórios.       |

### Tabela `Branches`

- **BranchID:** Identificador único do branch.
- **Nome:** Nome do branch.
- **RepoID:** ID do repositório ao qual o branch pertence.

### Tabela `Commits`

- **CommitID:** Identificador único do commit.
- **Mensagem:** Mensagem descritiva do commit.
- **DataCommit:** Data e hora do commit.
- **AutorID:** ID do utilizador que fez o commit.
- **BranchID:** ID do branch ao qual o commit pertence.

### Tabela `Issues`

- **IssueID:** Identificador único da issue.
- **Titulo:** Título da issue.
- **Descricao:** Descrição detalhada da issue.
- **Estado:** Estado atual da issue (Aberta ou Fechada).
- **RepoID:** ID do repositório ao qual a issue está associada.
- **AutorID:** ID do utilizador que criou a issue.
- **DataCriacao:** Data e hora de criação da issue.

### Tabela `Colaboradores`

- **RepoID:** ID do repositório.
- **UserID:** ID do utilizador colaborador.
- **PRIMARY KEY (RepoID, UserID)**: Chave primária composta pelos IDs do repositório e do utilizador.

## Funcionalidades

1. **Gestão de Utilizadores:** Regista informações básicas dos utilizadores, como nome, email e data de criação.
2. **Gestão de Repositórios:** Permite criar, visualizar e atualizar informações sobre repositórios, incluindo descrição, linguagem e última atualização.
3. **Gestão de Branches:** Possibilita criar e gerir branches em repositórios.
4. **Controlo de Commits:** Regista informações sobre commits, incluindo mensagem, data e autor.
5. **Gestão de Issues:** Permite criar e acompanhar problemas relatados nos repositórios, com estado de aberta ou fechada.
6. **Controlo de Colaboradores:** Permite associar utilizadores como colaboradores em repositórios específicos.

