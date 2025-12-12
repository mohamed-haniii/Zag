CREATE TABLE Airline (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Contact_Person_Name VARCHAR(100)
);

CREATE TABLE Airline_Phone (
    Airline_ID INT,
    Phone_Number VARCHAR(20),
    PRIMARY KEY (Airline_ID, Phone_Number),
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID) ON DELETE CASCADE
);

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Birth_Day INT CHECK (Birth_Day BETWEEN 1 AND 31),
    Birth_Month INT CHECK (Birth_Month BETWEEN 1 AND 12),
    Birth_Year INT,
    Gender CHAR(1),
    Position VARCHAR(50),
    Qualifications TEXT,
    Airline_ID INT NOT NULL,
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID) ON DELETE CASCADE
);

CREATE TABLE Aircraft (
    Aircraft_ID INT PRIMARY KEY,
    Capacity INT CHECK (Capacity > 0),
    Model VARCHAR(50) NOT NULL,
    Airline_ID INT NOT NULL,
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID) ON DELETE CASCADE
);

CREATE TABLE Route (
    Route_ID INT PRIMARY KEY,
    Origin VARCHAR(100) NOT NULL,
    Destination VARCHAR(100) NOT NULL,
    Distance DECIMAL(10,2) CHECK (Distance >= 0),
    Classification VARCHAR(20) 
);

CREATE TABLE Crew (
    Crew_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Aircraft_ID INT NOT NULL,
    FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID) 
);

CREATE TABLE Transaction1 (
    Transaction_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    Description TEXT,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount >= 0),
    Airline_ID INT NOT NULL,
    FOREIGN KEY (Airline_ID) REFERENCES Airline(Airline_ID) ON DELETE CASCADE
);

CREATE TABLE Flight_Schedule (
    Aircraft_ID INT,
    Route_ID INT,
    Departure_Date_Time DATETIME NOT NULL,
    Arrival_Date_Time DATETIME NOT NULL,
    Time_Spent_Travelling TIME,
    Number_of_Passengers INT CHECK (Number_of_Passengers >= 0),
    Price_Per_Passenger DECIMAL(10,2) CHECK (Price_Per_Passenger >= 0),
    PRIMARY KEY (Aircraft_ID, Route_ID, Departure_Date_Time),
    FOREIGN KEY (Aircraft_ID) REFERENCES Aircraft(Aircraft_ID),
    FOREIGN KEY (Route_ID) REFERENCES Route(Route_ID)
);

