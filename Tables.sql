CREATE TABLE User (
    user_id VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    case_email VARCHAR(30) UNIQUE
);

CREATE TABLE Has_role (
    user_id VARCHAR(50),
    role_id VARCHAR(50),
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Team (
    team_id VARCHAR(30) PRIMARY KEY,
    team_name VARCHAR(100),
    description TEXT
);

CREATE TABLE Comprised (
    user_id VARCHAR(50),
    team_id VARCHAR(50),
    PRIMARY KEY (user_id, team_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Event (
    event_id VARCHAR(100) PRIMARY KEY,
    event_name VARCHAR(150),
    event_date DATETIME,
    event_description TEXT
);

CREATE TABLE Plans (
    team_id VARCHAR(200),
    event_id VARCHAR(255),
    PRIMARY KEY (team_id, event_id),
    FOREIGN KEY (team_id) REFERENCES Team(team_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Venue (
    venue_id VARCHAR(255) PRIMARY KEY,
    building VARCHAR(255),
    room VARCHAR(255),
    max_people INT
);

CREATE TABLE Hosted_at (
    venue_id VARCHAR(255),
    event_id VARCHAR(255),
    PRIMARY KEY (venue_id, event_id),
    FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Equipment (
    equipment_id VARCHAR(255) PRIMARY KEY,
    equipment_type VARCHAR(255),
    status VARCHAR(255)
);

CREATE TABLE Uses (
    event_id VARCHAR(255),
    equipment_id VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    quantity INT,
    PRIMARY KEY (event_id, equipment_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

CREATE TABLE Budget (
    budget_id VARCHAR(255) PRIMARY KEY,
    total_budget INT,
    remaining_budget INT,
    budget_description TEXT
);

CREATE TABLE Allocated (
    budget_id VARCHAR(255),
    event_id VARCHAR(255),
    PRIMARY KEY (budget_id, event_id),
    FOREIGN KEY (budget_id) REFERENCES Budget(budget_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Expenses (
    purchase_id VARCHAR(255) PRIMARY KEY,
    purchase_date DATETIME,
    purchase_amount INT,
    purchase_description TEXT
);

CREATE TABLE Has (
    purchase_id VARCHAR(255),
    event_id VARCHAR(255),
    PRIMARY KEY (purchase_id, event_id),
    FOREIGN KEY (purchase_id) REFERENCES Expenses(purchase_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);
