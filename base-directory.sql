CREATE TABLE Usuarios (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Repositorios (
    RepoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Linguagem VARCHAR(50),
    UltimaAtualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CommitsCount INT DEFAULT 0,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    RepoID INT,
    FOREIGN KEY (RepoID) REFERENCES Repositorios(RepoID)
);

CREATE TABLE Commits (
    CommitID INT PRIMARY KEY AUTO_INCREMENT,
    Mensagem TEXT,
    DataCommit DATETIME DEFAULT CURRENT_TIMESTAMP,
    AutorID INT,
    BranchID INT,
    FOREIGN KEY (AutorID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

CREATE TABLE Issues (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255),
    Descricao TEXT,
    Estado ENUM('Aberta', 'Fechada') DEFAULT 'Aberta',
    RepoID INT,
    AutorID INT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RepoID) REFERENCES Repositorios(RepoID),
    FOREIGN KEY (AutorID) REFERENCES Usuarios(UserID)
);

CREATE TABLE Colaboradores (
    RepoID INT,
    UserID INT,
    PRIMARY KEY (RepoID, UserID),
    FOREIGN KEY (RepoID) REFERENCES Repositorios(RepoID),
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);
