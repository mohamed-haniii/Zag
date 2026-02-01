CREATE TABLE Sales_Office (
    Office_Number INT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_Code VARCHAR(20)
);

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Office_Number INT NOT NULL, 
    Manager_Of_Office INT NULL,
    FOREIGN KEY (Office_Number) REFERENCES Sales_Office(Office_Number) ON DELETE CASCADE,
);

CREATE TABLE Property (
    Property_ID INT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_Code VARCHAR(20),
    Office_Number INT NOT NULL, 
    FOREIGN KEY (Office_Number) REFERENCES Sales_Office(Office_Number) 
);

CREATE TABLE Owner (
    Owner_ID INT PRIMARY KEY,
    Owner_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Property_Ownership (
    Property_ID INT,
    Owner_ID INT,
    Percent_Owned DECIMAL(5,2) NOT NULL CHECK (Percent_Owned > 0 AND Percent_Owned <= 100),
    PRIMARY KEY (Property_ID, Owner_ID),
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID) ,
    FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID) 
);