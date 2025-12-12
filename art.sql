CREATE TABLE Artist (
    name VARCHAR(100) PRIMARY KEY,
    birthplace VARCHAR(100),
    age INT CHECK (age >= 0),
    art_style VARCHAR(50)
);

CREATE TABLE Artwork (
    title VARCHAR(200) PRIMARY KEY,
    year_made INT,
    type VARCHAR(50),
    price DECIMAL,
    artist_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (artist_name) REFERENCES Artist(name)
);

CREATE TABLE Group_Art (
    name VARCHAR(100) PRIMARY KEY
);

CREATE TABLE Customer (
    name VARCHAR(100) PRIMARY KEY,
    address VARCHAR(255),
    total_spent DECIMAL(12,2) 
);

CREATE TABLE Artwork_Group (
    artwork_title VARCHAR(200),
    group_name VARCHAR(100),
    PRIMARY KEY (artwork_title, group_name),
    FOREIGN KEY (artwork_title) REFERENCES Artwork(title) ,
    FOREIGN KEY (group_name) REFERENCES Group_Art(name) 
);

CREATE TABLE Customer_Artist_Like (
    customer_name VARCHAR(100),
    artist_name VARCHAR(100),
    PRIMARY KEY (customer_name, artist_name),
    FOREIGN KEY (customer_name) REFERENCES Customer(name) ,
    FOREIGN KEY (artist_name) REFERENCES Artist(name) 
);

CREATE TABLE Customer_Group_Like (
    customer_name VARCHAR(100),
    group_name VARCHAR(100),
    PRIMARY KEY (customer_name, group_name),
    FOREIGN KEY (customer_name) REFERENCES Customer(name) ,
    FOREIGN KEY (group_name) REFERENCES Group_Art(name) 
);