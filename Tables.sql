CREATE TABLE User (
    UserID VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    middle_name VARCHAR(255),
    last_name VARCHAR(255),
    case_email VARCHAR(255) UNIQUE
);


CREATE TABLE Has_role (
    UserID VARCHAR(255),
    RoleID VARCHAR(255),
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Team (
    TeamID VARCHAR(255) PRIMARY KEY,
    Team_name VARCHAR(255),
    Description TEXT
);


CREATE TABLE Comprised (
    UserID VARCHAR(255),
    TeamID VARCHAR(255),
    PRIMARY KEY (UserID, TeamID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE Event (
    EventID VARCHAR(255) PRIMARY KEY,
    Event_name VARCHAR(255),
    Event_date DATETIME,
    Event_description TEXT
);


CREATE TABLE Plans (
    TeamID VARCHAR(255),
    EventID VARCHAR(255),
    PRIMARY KEY (TeamID, EventID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);


CREATE TABLE Venue (
    VenueID VARCHAR(255) PRIMARY KEY,
    Building VARCHAR(255),
    room VARCHAR(255),
    Max_people INT
);


CREATE TABLE Hosted_at (
    VenueID VARCHAR(255),
    EventID VARCHAR(255),
    PRIMARY KEY (VenueID, EventID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);


CREATE TABLE Equipment (
    EquipmentID VARCHAR(255) PRIMARY KEY,
    Equipment_type VARCHAR(255),
    Status VARCHAR(255)
);


CREATE TABLE Uses (
    EventID VARCHAR(255),
    EquipmentID VARCHAR(255),
    Start_Date DATETIME,
    End_Date DATETIME,
    Quantity INT,
    PRIMARY KEY (EventID, EquipmentID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);


CREATE TABLE Budget (
    BudgetID VARCHAR(255) PRIMARY KEY,
    Total_budget INT,
    remaining_budget INT,
    budget_description TEXT
);


CREATE TABLE Allocated (
    BudgetID VARCHAR(255),
    EventID VARCHAR(255),
    PRIMARY KEY (BudgetID, EventID),
    FOREIGN KEY (BudgetID) REFERENCES Budget(BudgetID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);


CREATE TABLE Expenses (
    PurchaseID VARCHAR(255) PRIMARY KEY,
    PurchaseDate DATETIME,
    Purchase_Amount INT,
    Purchase_Description TEXT
);


CREATE TABLE Has (
    PurchaseID VARCHAR(255),
    EventID VARCHAR(255),
    PRIMARY KEY (PurchaseID, EventID),
    FOREIGN KEY (PurchaseID) REFERENCES Expenses(PurchaseID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
