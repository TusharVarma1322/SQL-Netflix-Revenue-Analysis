DROP DATABASE IF EXISTS netflix;
CREATE DATABASE netflix;
USE netflix;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Plans;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Profiles;
DROP TABLE IF EXISTS Content;
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS Subscribes;
DROP TABLE IF EXISTS PaymentHistory;
DROP TABLE IF EXISTS ViewingHistory;
DROP TABLE IF EXISTS CustomersLanguagePreferred;
DROP TABLE IF EXISTS Uses;
DROP TABLE IF EXISTS ChildAcc;
DROP TABLE IF EXISTS AdultAcc;
DROP TABLE IF EXISTS Devices;

-- CUSTOMERS -- 

CREATE TABLE Customers(
CUSTID VARCHAR(10),
FNAME VARCHAR(30),
LNAME VARCHAR(30),
BDATE DATE,
GENDER VARCHAR(1),
COUNTRY VARCHAR(30),
EMAIL VARCHAR(30),
CONSTRAINT Customers_PK PRIMARY KEY (CUSTID)
);

-- Customers --
INSERT INTO Customers(CUSTID, FNAME, LNAME, BDATE, GENDER, COUNTRY, EMAIL)
VALUES 
    ('C1', 'Jane', 'Porter', '1990-02-17', 'M', 'US', 'jane27@colorado.edu'),
    ('C2', 'Hank', 'Smith', '1984-03-20', 'F', 'US', 'hank34@icloud.com'),
    ('C3', 'Bill', 'Dobbs', '2001-04-17', 'M', 'US', 'bill71@gmail.com'),
    ('C4', 'Sandy', 'Peters', '1994-03-10', 'F', 'US', 'sandy21@mac.com'),
    ('C5', 'Josh', 'Jacobs', '1975-11-15', 'F', 'US', 'josh35@aol.com'),
    ('C6', 'Tim', 'Allen', '2001-03-21', 'M', 'US', 'allen34@gmail.com'),
    ('C7', 'John', 'Brown', '1992-08-05', 'M', 'UK', 'john.brown@gmail.com'),
    ('C8', 'Emma', 'Taylor', '1988-12-12', 'F', 'Canada', 'emma.taylor@gmail.com'),
    ('C9', 'Michael', 'Johnson', '1995-05-20', 'M', 'Australia', 'michael.johnson@gmail.com'),
    ('C10', 'Sophia', 'Clark', '1985-04-03', 'F', 'US', 'sophia.clark@gmail.com'),
    ('C11', 'Matthew', 'Wilson', '1998-02-28', 'M', 'UK', 'matthew.wilson@gmail.com'),
    ('C12', 'Olivia', 'Moore', '1990-07-15', 'F', 'Canada', 'olivia.moore@gmail.com'),
    ('C13', 'Andrew', 'Anderson', '1987-11-09', 'M', 'Australia', 'andrew.anderson@gmail.com'),
    ('C14', 'Isabella', 'White', '1993-09-22', 'F', 'US', 'isabella.white@gmail.com'),
    ('C15', 'James', 'Martin', '1984-06-18', 'M', 'UK', 'james.martin@gmail.com'),
    ('C16', 'Ava', 'Thompson', '1991-03-25', 'F', 'Canada', 'ava.thompson@gmail.com'),
    ('C17', 'David', 'Harris', '1986-10-11', 'M', 'Australia', 'david.harris@gmail.com'),
    ('C18', 'Mia', 'Walker', '1994-01-08', 'F', 'US', 'mia.walker@gmail.com'),
    ('C19', 'Daniel', 'King', '1989-12-01', 'M', 'UK', 'daniel.king@gmail.com'),
    ('C20', 'Emily', 'Green', '1996-07-04', 'F', 'Canada', 'emily.green@gmail.com'),
    ('C21', 'Sophie', 'Evans', '1983-05-29', 'M', 'Australia', 'sophie.evans@gmail.com'),
    ('C22', 'Logan', 'Hill', '1997-04-16', 'F', 'US', 'logan.hill@gmail.com'),
    ('C23', 'Benjamin', 'Young', '1982-02-13', 'M', 'UK', 'benjamin.young@gmail.com'),
    ('C24', 'Chloe', 'Roberts', '1988-09-26', 'F', 'Canada', 'chloe.roberts@gmail.com'),
    ('C25', 'Ethan', 'Lee', '1995-06-09', 'M', 'Australia', 'ethan.lee@gmail.com'),
    ('C26', 'Lily', 'Nelson', '1984-04-22', 'F', 'US', 'lily.nelson@gmail.com'),
    ('C27', 'Gabriel', 'Baker', '1992-01-17', 'M', 'UK', 'gabriel.baker@gmail.com'),
    ('C28', 'Grace', 'Garcia', '1990-08-30', 'F', 'Canada', 'grace.garcia@gmail.com'),
    ('C29', 'Jackson', 'Cook', '1987-12-23', 'M', 'Australia', 'jackson.cook@gmail.com'),
    ('C30', 'Hannah', 'Martinez', '1994-07-06', 'F', 'US', 'hannah.martinez@gmail.com'),
    ('C31', 'Lucas', 'Perez', '1983-06-01', 'M', 'UK', 'lucas.perez@gmail.com'),
    ('C32', 'Avery', 'Sanchez', '1991-03-14', 'F', 'Canada', 'avery.sanchez@gmail.com'),
    ('C33', 'Nathan', 'Rivera', '1986-10-27', 'M', 'Australia', 'nathan.rivera@gmail.com'),
    ('C34', 'Aria', 'Rossi', '1993-09-10', 'F', 'US', 'aria.rossi@gmail.com'),
    ('C35', 'Owen', 'Hernandez', '1984-06-25', 'M', 'UK', 'owen.hernandez@gmail.com'),
    ('C36', 'Mila', 'Gonzalez', '1990-03-08', 'F', 'Canada', 'mila.gonzalez@gmail.com'),
    ('C37', 'Isaac', 'Gomez', '1987-11-21', 'M', 'Australia', 'isaac.gomez@gmail.com'),
    ('C38', 'Aubrey', 'Kelly', '1994-01-14', 'F', 'US', 'aubrey.kelly@gmail.com'),
    ('C39', 'Levi', 'Howard', '1989-12-07', 'M', 'UK', 'levi.howard@gmail.com'),
    ('C40', 'Zoe', 'Bailey', '1996-07-20', 'F', 'Canada', 'zoe.bailey@gmail.com'),
    ('C41', 'Wyatt', 'Wright', '1983-06-14', 'M', 'Australia', 'wyatt.wright@gmail.com'),
    ('C42', 'Victoria', 'Thomas', '1997-05-01', 'F', 'US', 'victoria.thomas@gmail.com'),
    ('C43', 'Julian', 'Robinson', '1982-02-19', 'M', 'UK', 'julian.robinson@gmail.com'),
    ('C44', 'Madison', 'Lewis', '1988-09-02', 'F', 'Canada', 'madison.lewis@gmail.com'),
    ('C45', 'Leo', 'Walker', '1995-06-15', 'M', 'Australia', 'leo.walker@gmail.com'),
    ('C46', 'Ella', 'Harris', '1984-04-28', 'F', 'US', 'ella.harris@gmail.com'),
    ('C47', 'Lincoln', 'Clark', '1992-01-23', 'M', 'UK', 'lincoln.clark@gmail.com'),
    ('C48', 'Hazel', 'Martin', '1990-08-06', 'F', 'Canada', 'hazel.martin@gmail.com'),
    ('C49', 'Brooklyn', 'Adams', '1987-12-29', 'M', 'Australia', 'brooklyn.adams@gmail.com'),
    ('C50', 'Mateo', 'Parker', '1994-07-12', 'F', 'US', 'mateo.parker@gmail.com'),
    ('C51', 'Samantha', 'Gomez', '1983-06-07', 'M', 'UK', 'samantha.gomez@gmail.com'),
    ('C52', 'Luke', 'Cook', '1991-03-20', 'F', 'Canada', 'luke.cook@gmail.com'),
    ('C53', 'Luna', 'Rivera', '1986-11-02', 'M', 'Australia', 'luna.rivera@gmail.com'),
    ('C54', 'Christopher', 'Rossi', '1993-09-15', 'F', 'US', 'christopher.rossi@gmail.com'),
    ('C55', 'Gabriella', 'Hernandez', '1984-06-30', 'M', 'UK', 'gabriella.hernandez@gmail.com'),
    ('C56', 'Max', 'Gonzalez', '1990-03-13', 'F', 'Canada', 'max.gonzalez@gmail.com');


-- CustomersLanguagePreferred

Create table CustomersLanguagePreferred (
CustID VARCHAR(10),
Language VARCHAR(10),
CONSTRAINT Devices_FK_CustID FOREIGN KEY (CustID) REFERENCES `Customers`(CustID)
);

-- Insert records --
INSERT INTO CustomersLanguagePreferred(CustID, Language)
VALUES 
    ('C1', 'English'),
    ('C1', 'Japanese'),
    ('C1', 'Spanish'),
    ('C1', 'French'),
    ('C1', 'Hindi'),
    ('C2', 'English'),
    ('C2', 'French'),
    ('C2', 'Hindi'),
    ('C3', 'English'),
    ('C3', 'Spanish'),
    ('C4', 'English'),
    ('C4', 'Japanese'),
    ('C4', 'Spanish'),
    ('C4', 'French'),
    ('C3', 'Korean'),
    ('C4', 'Korean'),
    ('C5', 'English'),
    ('C5', 'Japanese'),
    ('C6', 'English'),
    ('C6', 'Spanish'),
    ('C6', 'French'),
    ('C6', 'Hindi'),
    ('C6', 'Japanese'),
    ('C7', 'English'),
    ('C7', 'French'),
    ('C7', 'Hindi'),
    ('C7', 'Korean'),
    ('C8', 'English'),
    ('C8', 'Spanish'),
    ('C8', 'Japanese'),
    ('C8', 'French'),
    ('C8', 'Hindi'),
    ('C9', 'English'),
    ('C9', 'Korean'),
    ('C10', 'English'),
    ('C10', 'Spanish'),
    ('C10', 'French'),
    ('C10', 'Hindi'),
    ('C10', 'Japanese'),
    ('C11', 'English'),
    ('C11', 'French'),
    ('C11', 'Hindi'),
    ('C11', 'Korean'),
    ('C12', 'English'),
    ('C12', 'Spanish'),
    ('C12', 'Japanese'),
    ('C12', 'French'),
    ('C12', 'Hindi'),
    ('C12', 'Korean'),
    ('C13', 'English'),
    ('C13', 'French'),
    ('C13', 'Hindi'),
    ('C13', 'Japanese'),
    ('C13', 'Korean'),
    ('C14', 'English'),
    ('C14', 'Spanish'),
    ('C14', 'French'),
    ('C14', 'Hindi'),
    ('C14', 'Japanese'),
    ('C14', 'Korean'),
    ('C15', 'English'),
    ('C15', 'Spanish'),
    ('C15', 'French'),
    ('C15', 'Hindi'),
    ('C15', 'Japanese'),
    ('C15', 'Korean'),
    ('C16', 'English'),
    ('C16', 'French'),
    ('C16', 'Hindi'),
    ('C16', 'Japanese'),
    ('C16', 'Korean'),
    ('C17', 'English'),
    ('C17', 'Spanish'),
    ('C17', 'French'),
    ('C17', 'Hindi'),
    ('C17', 'Japanese'),
    ('C17', 'Korean'),
    ('C18', 'English'),
    ('C18', 'French'),
    ('C18', 'Hindi'),
    ('C18', 'Japanese'),
    ('C18', 'Korean'),
    ('C19', 'English'),
    ('C19', 'Spanish'),
    ('C19', 'French'),
    ('C19', 'Hindi'),
    ('C19', 'Japanese'),
    ('C19', 'Korean'),
    ('C20', 'English'),
    ('C20', 'French'),
    ('C20', 'Hindi'),
    ('C20', 'Japanese'),
    ('C20', 'Korean'),
    ('C21', 'English'),
    ('C21', 'Spanish'),
    ('C21', 'French'),
    ('C21', 'Hindi'),
    ('C21', 'Japanese'),
    ('C21', 'Korean'),
    ('C22', 'English'),
    ('C22', 'French'),
    ('C22', 'Hindi'),
    ('C22', 'Japanese'),
    ('C22', 'Korean'),
    ('C23', 'English'),
    ('C23', 'Spanish'),
    ('C23', 'French'),
    ('C23', 'Hindi'),
    ('C23', 'Japanese'),
    ('C23', 'Korean'),
    ('C24', 'English'),
    ('C24', 'French'),
    ('C24', 'Hindi'),
    ('C24', 'Japanese'),
    ('C24', 'Korean'),
    ('C25', 'English'),
    ('C25', 'Spanish'),
    ('C25', 'French'),
    ('C25', 'Hindi'),
    ('C25', 'Japanese'),
    ('C25', 'Korean'),
    ('C26', 'English'),
    ('C26', 'French'),
    ('C26', 'Hindi'),
    ('C26', 'Japanese'),
    ('C26', 'Korean'),
    ('C27', 'English'),
    ('C27', 'Spanish'),
    ('C27', 'French'),
    ('C27', 'Hindi'),
    ('C27', 'Japanese'),
    ('C27', 'Korean'),
    ('C28', 'English'),
    ('C28', 'French'),
    ('C28', 'Hindi'),
    ('C28', 'Japanese'),
    ('C28', 'Korean'),
    ('C29', 'English'),
    ('C29', 'Spanish'),
    ('C29', 'French'),
    ('C29', 'Hindi'),
    ('C29', 'Japanese'),
    ('C29', 'Korean'),
    ('C30', 'English'),
    ('C30', 'French'),
    ('C30', 'Hindi'),
    ('C30', 'Japanese'),
    ('C30', 'Korean'),
    ('C35', 'Korean'),
    ('C36', 'English'),
    ('C46', 'Spanish'),
    ('C36', 'French'),
    ('C36', 'Hindi'),
    ('C56', 'Japanese'),
    ('C47', 'English'),
    ('C47', 'French'),
    ('C37', 'Hindi'),
    ('C47', 'Korean'),
    ('C38', 'English'),
    ('C38', 'Spanish'),
    ('C38', 'Japanese'),
    ('C48', 'French'),
    ('C48', 'Hindi'),
    ('C49', 'English'),
    ('C39', 'Korean'),
    ('C50', 'English'),
    ('C40', 'Spanish'),
    ('C30', 'French'),
    ('C30', 'Hindi'),
    ('C50', 'Japanese'),
    ('C51', 'English'),
    ('C31', 'French'),
    ('C41', 'Hindi'),
    ('C41', 'Korean'),
    ('C42', 'English'),
    ('C32', 'Spanish'),
    ('C52', 'Japanese'),
    ('C2', 'French'),
    ('C52', 'Hindi'),
    ('C42', 'Korean'),
    ('C43', 'English'),
    ('C33', 'French'),
    ('C33', 'Hindi'),
    ('C53', 'Japanese'),
    ('C43', 'Korean'),
    ('C44', 'English'),
    ('C44', 'Spanish'),
    ('C54', 'French'),
    ('C34', 'Hindi'),
    ('C24', 'Japanese'),
    ('C14', 'Korean'),
    ('C55', 'English'),
    ('C45', 'Spanish'),
    ('C35', 'French'),
    ('C35', 'Hindi'),
    ('C45', 'Japanese'),
    ('C35', 'Korean'),
    ('C46', 'English'),
    ('C46', 'French'),
    ('C36', 'Hindi'),
    ('C56', 'Japanese'),
    ('C56', 'Korean'),
    ('C37', 'English'),
    ('C37', 'Spanish'),
    ('C47', 'French'),
    ('C47', 'Hindi'),
    ('C47', 'Japanese'),
    ('C37', 'Korean'),
    ('C38', 'English'),
    ('C38', 'French'),
    ('C38', 'Hindi'),
    ('C38', 'Japanese'),
    ('C48', 'Korean'),
    ('C39', 'English'),
    ('C39', 'Spanish'),
    ('C39', 'French'),
    ('C49', 'Hindi'),
    ('C49', 'Japanese'),
    ('C49', 'Korean'),
    ('C40', 'English'),
    ('C30', 'French'),
    ('C30', 'Hindi'),
    ('C50', 'Japanese'),
    ('C40', 'Korean'),
    ('C51', 'English');


-- PLANS --

CREATE TABLE Plans(
PlanID VARCHAR(10),
AdSupport VARCHAR(3),
NumOfSupportDevForDownload INT,
PlanName VARCHAR(30),
NumOfProfiles INT,
VideoQuality VARCHAR(30),
NumOfSupportDevForView INT,
MonthlyPrice FLOAT(5,2),
ContentAccess VARCHAR(30),
CONSTRAINT Plans_PK PRIMARY KEY (PlanID)
);

-- Insert Records --
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P1','Yes','0','Standard w/ Ads','1','Full HD','2','6.99','limited');
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P2','No','2','Standard ','2','Full HD','2','15.49','unlimited');
INSERT INTO Plans(PlanID,AdSupport,NumOfSupportDevForDownload,PlanName,NumOfProfiles,VideoQuality,NumOfSupportDevForView,MonthlyPrice,ContentAccess) VALUES ('P3','No','6','Premium','4','Ultra HD','4','22.99','unlimited');



-- PAYMENT METHOD --

CREATE TABLE PaymentMethod(
CardID VARCHAR(10),
CVV VARCHAR(3),
ExpirationDate Date,
CardNumber VARCHAR(30),
ZipCode INT,
State VARCHAR(30),
City VARCHAR (30),
Street VARCHAR (30),
CUSTID VARCHAR(10),
CONSTRAINT PaymentMethod_PK PRIMARY KEY(CardID),
CONSTRAINT PaymentMethod_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID)
);

-- Insert Records --
INSERT INTO PaymentMethod(CardID, CVV, ExpirationDate, CardNumber, ZipCode, State, City, Street, CustID)
VALUES 
    ('CP2645', '3xx', '2028-04-23', 'xxxx-xxxx-6372', '80023', 'Colorado', 'Denver', '2755 Olive Street', 'C1'),
    ('CP3847', '6xx', '2030-09-02', 'xxxx-xxxx-7845', '89954', 'Colorado', 'Boulder', '147 Pearl Street', 'C2'),
    ('CP7489', '8xx', '2024-02-17', 'xxxx-xxxx-1234', '78521', 'Texas', 'Austin', '130 Lyndhurst st', 'C3'),
    ('CP0346', '7xx', '2026-12-28', 'xxxx-xxxx-7777', '82001', 'Wyoming', 'Cody', '567 Fox Street', 'C4'),
    ('CP1280', '9xx', '2025-06-07', 'xxxx-xxxx-5643', '84404', 'Utah', 'Salt Lake City', '789 Drake Street', 'C5'),
    ('CP2067', '1xx', '2027-08-15', 'xxxx-xxxx-9999', '90001', 'California', 'Los Angeles', '123 Main Street', 'C6'),
    ('CP3098', '5xx', '2029-03-12', 'xxxx-xxxx-1111', '77002', 'Texas', 'Houston', '456 Elm Street', 'C7'),
    ('CP4098', '2xx', '2031-11-30', 'xxxx-xxxx-2222', '60601', 'Illinois', 'Chicago', '789 Oak Street', 'C8'),
    ('CP5076', '0xx', '2028-05-25', 'xxxx-xxxx-3333', '30301', 'Georgia', 'Atlanta', '101 Pine Avenue', 'C9'),
    ('CP6098', '4xx', '2030-07-18', 'xxxx-xxxx-4444', '98101', 'Washington', 'Seattle', '456 Maple Drive', 'C10'),
    ('CP7065', '3xx', '2026-09-29', 'xxxx-xxxx-5555', '37201', 'Tennessee', 'Nashville', '789 Cedar Lane', 'C11'),
    ('CP8012', '7xx', '2025-12-10', 'xxxx-xxxx-6666', '75201', 'Texas', 'Dallas', '321 Pine Street', 'C12'),
    ('CP9010', '6xx', '2027-04-05', 'xxxx-xxxx-7777', '94102', 'California', 'San Francisco', '654 Broadway Avenue', 'C13'),
    ('CP1002', '9xx', '2029-02-28', 'xxxx-xxxx-8888', '80202', 'Colorado', 'Denver', '987 Walnut Boulevard', 'C14'),
    ('CP1100', '8xx', '2032-01-15', 'xxxx-xxxx-9999', '10001', 'New York', 'New York City', '741 Madison Street', 'C15'),
    ('CP1205', '5xx', '2026-06-21', 'xxxx-xxxx-1111', '30339', 'Georgia', 'Atlanta', '852 Peachtree Road', 'C16'),
    ('CP1309', '1xx', '2028-03-18', 'xxxx-xxxx-2222', '98109', 'Washington', 'Seattle', '369 Pine Street', 'C17'),
    ('CP1415', '0xx', '2027-10-04', 'xxxx-xxxx-3333', '20001', 'District of Columbia', 'Washington', '456 Elm Avenue', 'C18'),
    ('CP1503', '4xx', '2029-11-02', 'xxxx-xxxx-4444', '60611', 'Illinois', 'Chicago', '789 Maple Lane', 'C19'),
    ('CP1608', '2xx', '2028-08-09', 'xxxx-xxxx-5555', '37203', 'Tennessee', 'Nashville', '963 Oak Street', 'C20'),
    ('CP1701', '3xx', '2026-05-12', 'xxxx-xxxx-6666', '90012', 'California', 'Los Angeles', '321 Cedar Avenue', 'C21'),
    ('CP1804', '6xx', '2025-09-27', 'xxxx-xxxx-7777', '94110', 'California', 'San Francisco', '654 Elm Street', 'C22'),
    ('CP1906', '7xx', '2030-07-30', 'xxxx-xxxx-8888', '80211', 'Colorado', 'Denver', '987 Maple Drive', 'C23'),
    ('CP2009', '8xx', '2027-12-22', 'xxxx-xxxx-9999', '10011', 'New York', 'New York City', '741 Walnut Boulevard', 'C24'),
    ('CP2108', '9xx', '2031-05-19', 'xxxx-xxxx-1111', '30349', 'Georgia', 'Atlanta', '852 Pine Avenue', 'C25'),
    ('CP2203', '5xx', '2029-09-14', 'xxxx-xxxx-2222', '98104', 'Washington', 'Seattle', '369 Elm Street', 'C26'),
    ('CP2305', '1xx', '2028-11-03', 'xxxx-xxxx-3333', '20002', 'District of Columbia', 'Washington', '456 Oak Avenue', 'C27'),
    ('CP2407', '4xx', '2027-06-28', 'xxxx-xxxx-4444', '60622', 'Illinois', 'Chicago', '789 Pine Lane', 'C28'),
    ('CP2501', '0xx', '2030-04-25', 'xxxx-xxxx-5555', '37204', 'Tennessee', 'Nashville', '963 Cedar Street', 'C29'),
    ('CP2606', '3xx', '2026-02-17', 'xxxx-xxxx-6666', '90024', 'California', 'Los Angeles', '321 Maple Avenue', 'C30'),
    ('CP2646', '3xx', '2028-04-23', 'xxxx-xxxx-6372', '80023', 'Colorado', 'Denver', '2755 Olive Street', 'C31'),
    ('CP3849', '6xx', '2030-09-02', 'xxxx-xxxx-7845', '89954', 'Colorado', 'Boulder', '147 Pearl Street', 'C32'),
    ('CP7483', '8xx', '2024-02-17', 'xxxx-xxxx-1234', '78521', 'Texas', 'Austin', '130 Lyndhurst st', 'C33'),
    ('CP0342', '7xx', '2026-12-28', 'xxxx-xxxx-7777', '82001', 'Wyoming', 'Cody', '567 Fox Street', 'C34'),
    ('CP1281', '9xx', '2025-06-07', 'xxxx-xxxx-5643', '84404', 'Utah', 'Salt Lake City', '789 Drake Street', 'C35'),
    ('CP2063', '1xx', '2027-08-15', 'xxxx-xxxx-9999', '90001', 'California', 'Los Angeles', '123 Main Street', 'C36'),
    ('CP3099', '5xx', '2029-03-12', 'xxxx-xxxx-1111', '77002', 'Texas', 'Houston', '456 Elm Street', 'C37'),
    ('CP4091', '2xx', '2031-11-30', 'xxxx-xxxx-2222', '60601', 'Illinois', 'Chicago', '789 Oak Street', 'C38'),
    ('CP5072', '0xx', '2028-05-25', 'xxxx-xxxx-3333', '30301', 'Georgia', 'Atlanta', '101 Pine Avenue', 'C39'),
    ('CP6097', '4xx', '2030-07-18', 'xxxx-xxxx-4444', '98101', 'Washington', 'Seattle', '456 Maple Drive', 'C40'),
    ('CP7062', '3xx', '2026-09-29', 'xxxx-xxxx-5555', '37201', 'Tennessee', 'Nashville', '789 Cedar Lane', 'C41'),
    ('CP8016', '7xx', '2025-12-10', 'xxxx-xxxx-6666', '75201', 'Texas', 'Dallas', '321 Pine Street', 'C42'),
    ('CP9013', '6xx', '2027-04-05', 'xxxx-xxxx-7777', '94102', 'California', 'San Francisco', '654 Broadway Avenue', 'C43'),
    ('CP1004', '9xx', '2029-02-28', 'xxxx-xxxx-8888', '80202', 'Colorado', 'Denver', '987 Walnut Boulevard', 'C44'),
    ('CP1103', '8xx', '2032-01-15', 'xxxx-xxxx-9999', '10001', 'New York', 'New York City', '741 Madison Street', 'C45'),
    ('CP1202', '5xx', '2026-06-21', 'xxxx-xxxx-1111', '30339', 'Georgia', 'Atlanta', '852 Peachtree Road', 'C46'),
    ('CP1304', '1xx', '2028-03-18', 'xxxx-xxxx-2222', '98109', 'Washington', 'Seattle', '369 Pine Street', 'C47'),
    ('CP1412', '0xx', '2027-10-04', 'xxxx-xxxx-3333', '20001', 'District of Columbia', 'Washington', '456 Elm Avenue', 'C48'),
    ('CP1506', '4xx', '2029-11-02', 'xxxx-xxxx-4444', '60611', 'Illinois', 'Chicago', '789 Maple Lane', 'C49'),
    ('CP1607', '2xx', '2028-08-09', 'xxxx-xxxx-5555', '37203', 'Tennessee', 'Nashville', '963 Oak Street', 'C50'),
    ('CP1702', '3xx', '2026-05-12', 'xxxx-xxxx-6666', '90012', 'California', 'Los Angeles', '321 Cedar Avenue', 'C51'),
    ('CP1805', '6xx', '2025-09-27', 'xxxx-xxxx-7777', '94110', 'California', 'San Francisco', '654 Elm Street', 'C52'),
    ('CP1902', '7xx', '2030-07-30', 'xxxx-xxxx-8888', '80211', 'Colorado', 'Denver', '987 Maple Drive', 'C53'),
    ('CP2005', '8xx', '2027-12-22', 'xxxx-xxxx-9999', '10011', 'New York', 'New York City', '741 Walnut Boulevard', 'C54'),
    ('CP2102', '9xx', '2031-05-19', 'xxxx-xxxx-1111', '30349', 'Georgia', 'Atlanta', '852 Pine Avenue', 'C55'),
    ('CP2204', '5xx', '2029-09-14', 'xxxx-xxxx-2222', '98104', 'Washington', 'Seattle', '369 Elm Street', 'C56');


-- CONTENT -- 

Create table Content(
ContentID VARCHAR(10),
Genre VARCHAR(20),
TitleName VARCHAR(50),
Category VARCHAR(10),
UnlimitedAccess VARCHAR (5),
CONSTRAINT Content_PK PRIMARY KEY (ContentID)
);

-- Insert Records --
INSERT INTO Content(ContentID, Genre, TitleName, Category, UnlimitedAccess)
VALUES 
    ('Con1', 'Horror', 'Conjuring', 'Movie', 'Yes'),
    ('Con2', 'Action', 'Extraction', 'Movie', 'Yes'),
    ('Con3', 'Romantic', 'Titanic', 'Movie', 'No'),
    ('Con4', 'Comedy', 'Friends', 'TV Show', 'Yes'),
    ('Con5', 'Action', 'Spider-Man', 'Movie', 'Yes'),
    ('Con6', 'Action', 'Hulk', 'Movie', 'No'),
    ('Con7', 'Crime', 'Catch Me If You Can', 'Movie', 'Yes'),
    ('Con8', 'Crime', 'Money Heist', 'TV Show', 'Yes'),
    ('Con9', 'Drama', 'The Notebook', 'Movie', 'No'),
    ('Con10', 'Adventure', 'Indiana Jones and the Last Crusade', 'Movie', 'Yes'),
    ('Con11', 'Sci-Fi', 'Inception', 'Movie', 'Yes'),
    ('Con12', 'Fantasy', 'Harry Potter and the Philosopher\'s Stone', 'Movie', 'Yes'),
    ('Con13', 'Thriller', 'The Silence of the Lambs', 'Movie', 'No'),
    ('Con14', 'Comedy', 'The Office', 'TV Show', 'Yes'),
    ('Con15', 'Romantic', 'La La Land', 'Movie', 'Yes'),
    ('Con16', 'Action', 'Die Hard', 'Movie', 'Yes'),
    ('Con17', 'Horror', 'The Shining', 'Movie', 'No'),
    ('Con18', 'Drama', 'Forrest Gump', 'Movie', 'Yes'),
    ('Con19', 'Sci-Fi', 'The Matrix', 'Movie', 'Yes'),
    ('Con20', 'Comedy', 'Parks and Recreation', 'TV Show', 'Yes'),
    ('Con21', 'Action', 'Mad Max: Fury Road', 'Movie', 'Yes'),
    ('Con22', 'Fantasy', 'Game of Thrones', 'TV Show', 'Yes'),
    ('Con23', 'Crime', 'Breaking Bad', 'TV Show', 'Yes'),
    ('Con24', 'Adventure', 'Jurassic Park', 'Movie', 'Yes'),
    ('Con25', 'Romantic', 'Notting Hill', 'Movie', 'No'),
    ('Con26', 'Action', 'The Dark Knight', 'Movie', 'Yes'),
    ('Con27', 'Sci-Fi', 'Interstellar', 'Movie', 'Yes'),
    ('Con28', 'Horror', 'Psycho', 'Movie', 'No'),
    ('Con29', 'Drama', 'The Shawshank Redemption', 'Movie', 'Yes'),
    ('Con30', 'Comedy', 'Brooklyn Nine-Nine', 'TV Show', 'Yes');




-- SUBSCRIBES --

CREATE TABLE Subscribes(
StartDate DATE,
CustID VARCHAR(10),
PlanID VARCHAR(10),
Status VARCHAR(30),
EndDate DATE,
CONSTRAINT Subscribes_PK PRIMARY KEY (CustID, PlanID, Status),
CONSTRAINT Subscribes_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID),
CONSTRAINT Subscribes_FK_Plans FOREIGN KEY (PLANID) REFERENCES `Plans`(PLANID)
);

-- Insert Records --
INSERT INTO Subscribes(StartDate, CustID, PlanID, Status, EndDate)
VALUES 
    ('2021-08-16', 'C1', 'P1', 'Active', NULL),
    ('2022-11-26', 'C2', 'P3', 'Inactive', '2023-08-14'),
    ('2019-10-08', 'C3', 'P1', 'Inactive', '2020-11-06'),
    ('2021-06-22', 'C4', 'P2', 'Active', NULL),
    ('2023-01-01', 'C5', 'P3', 'Active', NULL),
    ('2020-11-06', 'C3', 'P2', 'Active', NULL),
    ('2020-11-06', 'C6', 'P3', 'Inactive', '2023-06-14'),
    ('2022-03-15', 'C7', 'P2', 'Active', NULL),
    ('2023-04-20', 'C8', 'P1', 'Active', NULL),
    ('2022-09-10', 'C9', 'P3', 'Active', NULL),
    ('2023-02-28', 'C4', 'P1', 'Active', NULL),
    ('2022-07-01', 'C56', 'P2', 'Active', NULL),
    ('2021-12-10', 'C46', 'P2', 'Active', NULL),
    ('2023-05-05', 'C10', 'P3', 'Active', NULL),
    ('2021-10-15', 'C21', 'P2', 'Active', NULL),
    ('2022-08-20', 'C32', 'P1', 'Active', NULL),
    ('2023-03-25', 'C44', 'P3', 'Active', NULL),
    ('2022-06-05', 'C51', 'P1', 'Active', NULL),
    ('2022-01-30', 'C16', 'P1', 'Active', NULL),
    ('2021-09-25', 'C17', 'P2', 'Inactive', '2024-03-15'),
    ('2023-06-10', 'C26', 'P1', 'Inactive', '2024-12-01'),
    ('2022-04-12', 'C32', 'P3', 'Inactive', '2023-09-10'),
    ('2021-11-20', 'C41', 'P2', 'Inactive', '2023-05-01'),
    ('2023-08-05', 'C51', 'P3', 'Inactive', '2025-02-28'),
    ('2023-01-15', 'C26', 'P2', 'Inactive', '2024-07-10'),
    ('2021-09-25', 'C11', 'P2', 'Inactive', '2024-03-15'),
    ('2023-06-10', 'C12', 'P1', 'Inactive', '2024-12-01'),
    ('2022-04-12', 'C13', 'P3', 'Inactive', '2023-09-10'),
    ('2021-11-20', 'C14', 'P2', 'Inactive', '2023-05-01'),
    ('2023-08-05', 'C15', 'P3', 'Inactive', '2025-02-28'),
    ('2023-01-15', 'C16', 'P2', 'Inactive', '2024-07-10'),
    ('2022-03-15', 'C17', 'P2', 'Active', NULL),
    ('2023-04-20', 'C21', 'P1', 'Active', NULL),
    ('2022-09-10', 'C23', 'P3', 'Active', NULL),
    ('2023-02-28', 'C24', 'P1', 'Active', NULL),
    ('2022-07-01', 'C25', 'P2', 'Active', NULL),
    ('2021-12-10', 'C26', 'P2', 'Active', NULL),
    ('2023-05-05', 'C31', 'P3', 'Active', NULL),
    ('2021-10-15', 'C32', 'P2', 'Active', NULL),
    ('2022-08-20', 'C33', 'P1', 'Active', NULL),
    ('2023-03-25', 'C34', 'P3', 'Active', NULL),
    ('2022-06-05', 'C35', 'P1', 'Active', NULL),
    ('2022-01-30', 'C36', 'P1', 'Active', NULL);




-- Payment History --

CREATE TABLE PaymentHistory(
PaymentID VARCHAR(10),
PaymentDate VARCHAR(10),
PaymentAmount VARCHAR(10),
CardID VARCHAR(30),
CONSTRAINT PaymentHistory_PK PRIMARY KEY (PaymentID, PaymentDate, PaymentAmount, CardID),
CONSTRAINT PaymentHistory_FK_CardID FOREIGN KEY (CardID) REFERENCES `PaymentMethod`(CardID)
);

-- Insert Records --
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV156','2023-11-16','6.99','CP2645');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV478','2023-11-26','22.99','CP3847');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV567','2023-11-08','15.49','CP7489');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV098','2023-11-22','15.49','CP0346');
INSERT INTO PaymentHistory(PaymentID,PaymentDate,PaymentAmount,CardID) VALUES ('INV234','2023-11-01','22.99','CP1280');



-- PROFILES --

CREATE TABLE Profiles(
ProfileID VARCHAR(10),
ProfileName VARCHAR(30),
CustID VARCHAR(10),
CONSTRAINT Profiles_PK PRIMARY KEY (ProfileID),
CONSTRAINT Profiles_FK_Customers FOREIGN KEY (CUSTID) REFERENCES `Customers`(CUSTID)
);

-- 17 Records --
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C1','John','C1');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C2','Boney','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C2','Jennie','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('C01C2','Peter','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('D01C2','Harsh','C2');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C3','Pretty','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C4','Ben','C4');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C4','Sally','C4');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C5','Pinky','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B01C5','Sophia ','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('C01C5','Jane','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('D01C5','James','C5');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A02C3','Billy','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('B02C3','Max','C3');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A01C6','Mat','C6');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A02C6','Tia','C6');
INSERT INTO Profiles(ProfileID,ProfileName,CustID) VALUES ('A03C6','Bill','C6');


-- ChildAcc --

-- Ratings Type: TV-Y, G, PG, TV-Y7, PG-13, R

CREATE TABLE ChildAcc(
ProfileID VARCHAR(10),
MaxParentalRating VARCHAR(30),
CONSTRAINT ChildAcc_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);

-- Insert Records --
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C2', 'TV-Y7');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C4', 'G');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A02C6', 'G');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('A01C6', 'PG-13');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('C01C5', 'PG-13');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('B01C4', 'R');
INSERT INTO ChildAcc(ProfileID, MaxParentalRating) VALUES('B02C3', 'R');

-- AdultAcc --

CREATE TABLE AdultAcc(
ProfileID VARCHAR(10),
NoOfChildren int,
CONSTRAINT AdultAcc_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
 );
 
-- Insert Records -- 
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C1', 2);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C3', 2);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A02C3', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A01C5', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('A03C6', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('B01C2', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('C01C2', 1);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('D01C5', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('D01C2', 0);
INSERT INTO AdultAcc(ProfileID, NoOfChildren) VALUES('B01C5', 1);
 
-- VIEWINGHISTORY --

CREATE TABLE ViewingHistory(
ContentID VARCHAR(10),
ProfileID VARCHAR(10),
LastWatchedDate DATE,
Runtime INT,
CONSTRAINT ViewingHistory_PK PRIMARY KEY (ContentID, ProfileID),
CONSTRAINT ViewingHistory_FK_ContentID FOREIGN KEY (ContentID) REFERENCES `Content`(ContentID),
CONSTRAINT ViewingHistory_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);


-- Insert Records --
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','A01C6','2022-12-14','60');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C2','2023-08-14','20');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con1','A01C5','2023-11-01','20');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C5','2023-10-08','16');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','A01C5','2023-10-20','35');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con4','A01C5','2023-08-01','47');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','A01C5','2023-01-19','29');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','B01C5','2023-11-01','46');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','B01C5','2023-10-08','10');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con6','B01C5','2023-10-20','13');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con8','B01C5','2023-08-01','18');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con1','C01C5','2023-01-19','30');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con3','C01C5','2023-11-01','26');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con5','C01C5','2023-10-08','29');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con7','D01C5','2023-10-20','31');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con8','D01C5','2023-08-01','42');
INSERT INTO ViewingHistory(ContentID,ProfileID,LastWatchedDate,Runtime) VALUES ('Con2','A01C1','2023-01-19','28');


-- DEVICES --

Create table Devices (
DeviceID VARCHAR(10),
DeviceType VARCHAR(10),
CONSTRAINT Devices_PK PRIMARY KEY (DeviceID)
);

-- Insert Records --
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T001','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T002','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T003','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T004','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T005','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T006','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T007','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T008','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T009','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T010','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T011','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T012','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T013','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0T014','Tablet');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V001','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V002','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M001','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L001','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V003','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M002','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L002','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V004','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M003','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L003','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V005','Smart TV');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0M004','Mobile');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0L004','Laptop');
INSERT INTO Devices(DeviceID, DeviceType) VALUES ('D0V006','Smart TV');


-- Uses -- 

Create table Uses (
ProfileID VARCHAR(10),
DeviceID VARCHAR(10),
CONSTRAINT Uses_FK_DeviceID FOREIGN KEY (DeviceID) REFERENCES `Devices`(DeviceID),
CONSTRAINT Uses_FK_ProfileID FOREIGN KEY (ProfileID) REFERENCES `Profiles`(ProfileID)
);

-- Insert Records --
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C1','D0T001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C2','D0T002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C2','D0T003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C2','D0T004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C2','D0T005');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C3','D0T006');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C4','D0T007');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C4','D0T008');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C5','D0T009');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C5','D0T010');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C5','D0T011');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C5','D0T012');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A02C3','D0T013');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B02C3','D0T014');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C1','D0V001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C2','D0V002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C2','D0M001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C2','D0L001');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C2','D0V003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C3','D0M002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C4','D0L002');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C4','D0V004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A01C5','D0M003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B01C5','D0L003');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('C01C5','D0V005');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('D01C5','D0M004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('A02C3','D0L004');
INSERT INTO Uses(ProfileID, DeviceID) VALUES ('B02C3','D0V006');

