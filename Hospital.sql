CREATE TABLE Ward (
    Ward_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Nurse (
    Nurse_Number INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Ward_ID INT UNIQUE NOT NULL, 
    FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID)
);


CREATE TABLE Consultant (
    Consultant_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Date_Of_Birth DATE,
    Ward_ID INT NOT NULL,
    Leading_Consultant_ID INT NOT NULL,
    FOREIGN KEY (Ward_ID) REFERENCES Ward(Ward_ID),
    FOREIGN KEY (Leading_Consultant_ID) REFERENCES Consultant(Consultant_ID) 
);

CREATE TABLE Drug (
    Code_Number VARCHAR(50) PRIMARY KEY,
    Recommended_Dosage VARCHAR(100)
);

CREATE TABLE Drug_Brand (
    Code_Number VARCHAR(50),
    Brand_Name VARCHAR(100),
    PRIMARY KEY (Code_Number, Brand_Name),
    FOREIGN KEY (Code_Number) REFERENCES Drug(Code_Number) 
);

CREATE TABLE Patient_Consultant_Exam (
    Patient_ID INT,
    Consultant_ID INT,
    Exam_Date DATE NOT NULL,
    Notes TEXT,
    PRIMARY KEY (Patient_ID, Consultant_ID, Exam_Date),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Consultant_ID) REFERENCES Consultant(Consultant_ID) 
);

CREATE TABLE Medication_Record (
    Nurse_Number INT,
    Patient_ID INT,
    Drug_Code VARCHAR(50),
    Dosage VARCHAR(100) NOT NULL, 
    Date_Time DATETIME NOT NULL,
    PRIMARY KEY (Nurse_Number, Patient_ID, Drug_Code, Date_Time),
    FOREIGN KEY (Nurse_Number) REFERENCES Nurse(Nurse_Number),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID) ,
    FOREIGN KEY (Drug_Code) REFERENCES Drug(Code_Number)
);