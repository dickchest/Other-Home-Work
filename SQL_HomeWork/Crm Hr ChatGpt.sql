create database  if not exists crm_hr_chat;

use `crm_hr_chat`;

CREATE TABLE Candidates (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    PositionID INT, 
    InterviewDate DATETIME,
    InterviewResult VARCHAR(255),
    Comments TEXT,
    FOREIGN KEY (PositionID) REFERENCES Vacancies(ID)
);

-- Таблица "Вакансии"
CREATE TABLE Vacancies (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    JobTitle VARCHAR(255) NOT NULL,
    Description TEXT,
    Salary DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    Status ENUM('Открыта', 'Закрыта') DEFAULT 'Открыта',
    ResponsibleEmployeeID INT,
    FOREIGN KEY (ResponsibleEmployeeID) REFERENCES Employees(ID)
);

-- Таблица "Контакты"
CREATE TABLE Contacts (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Company VARCHAR(255),
    Position VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255),
    CandidateID INT,
    ClientID INT,
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ID)
);

-- Таблица "Интервью"
CREATE TABLE Interviews (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    InterviewDateTime DATETIME,
    Location VARCHAR(255),
    CandidateID INT,
    ResponsibleEmployeeID INT,
    Comments TEXT,
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID),
    FOREIGN KEY (ResponsibleEmployeeID) REFERENCES Employees(ID)
);

-- Таблица "Контракты"
CREATE TABLE Contracts (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE,
    EndDate DATE,
    Salary DECIMAL(10, 2),
    ContractType VARCHAR(255),
    CandidateID INT,
    ResponsibleEmployeeID INT,
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID),
    FOREIGN KEY (ResponsibleEmployeeID) REFERENCES Employees(ID)
);

-- Таблица "Задачи"
CREATE TABLE Tasks (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    Status ENUM('В работе', 'Выполнено') DEFAULT 'В работе',
    ResponsibleEmployeeID INT,
    CandidateID INT,
    VacancyID INT,
    FOREIGN KEY (ResponsibleEmployeeID) REFERENCES Employees(ID),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID),
    FOREIGN KEY (VacancyID) REFERENCES Vacancies(ID)
);

-- Таблица "Коммуникации"
CREATE TABLE Communications (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CommunicationDateTime DATETIME,
    CommunicationType VARCHAR(255),
    ContactID INT,
    CandidateID INT,
    VacancyID INT,
    ResponsibleEmployeeID INT,
    FOREIGN KEY (ContactID) REFERENCES Contacts(ID),
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID),
    FOREIGN KEY (VacancyID) REFERENCES Vacancies(ID),
    FOREIGN KEY (ResponsibleEmployeeID) REFERENCES Employees(ID)
);

-- Таблица "Сотрудники"
CREATE TABLE Employees (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Position VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255)
);

-- Таблица "Клиенты"
CREATE TABLE Clients (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CompanyName VARCHAR(255) NOT NULL,
    Description TEXT,
    ContactID INT
);
alter table clientsclients
add constraint contact_Id
FOREIGN KEY (ContactID) REFERENCES Contacts(ID);

-- Таблица "Компенсации"
CREATE TABLE Compensations (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Salary DECIMAL(10, 2),
    PaymentDate DATE,
    Comments TEXT,
    CandidateID INT,
    FOREIGN KEY (CandidateID) REFERENCES Candidates(ID)
);