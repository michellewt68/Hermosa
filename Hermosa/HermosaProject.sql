CREATE DATABASE HERMOSA
USE HERMOSA

CREATE TABLE MsStaff (
	StaffID CHAR (5) PRIMARY KEY NOT NULL CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR (50) NOT NULL,
	StaffGender VARCHAR (10) CHECK (StaffGender LIKE 'Female' OR StaffGender LIKE 'Male') NOT NULL,
	StaffSalary NUMERIC (11,2) NOT NULL,
	StaffEmail VARCHAR(50) NOT NULL,
	StaffPhone VARCHAR (15) CHECK (StaffPhone LIKE '+62%') NOT NULL,
	StaffAddress VARCHAR(100) NOT NULL
)

SELECT * FROM MsStaff
DROP TABLE MsStaff


CREATE TABLE MsSupplier (
	SupplierID CHAR (5) PRIMARY KEY NOT NULL CHECK (SupplierID LIKE 'VD[0-9][0-9][0-9]'),
	SupplierName VARCHAR (50) NOT NULL,
	SupplierPhone VARCHAR (15) CHECK (SupplierPhone LIKE '+62%') NOT NULL,
	SupplierEmail VARCHAR (50) NOT NULL,
	SupplierAddress VARCHAR (100) NOT NULL
)

SELECT * FROM MsSupplier
DROP TABLE MsSupplier

CREATE TABLE Payment (
	PaymentID CHAR (5) PRIMARY KEY NOT NULL CHECK (PaymentID LIKE 'PY[0-9][0-9][0-9]'),
	PaymentType VARCHAR(5) NOT NULL CHECK (PaymentType LIKE 'OVO' OR PaymentType LIKE 'GOPAY' 
										OR PaymentType LIKE 'BCA' OR PaymentType LIKE 'CASH'),
	PaymentAmount NUMERIC (11,2) NOT NULL
)

SELECT * FROM Payment
DROP TABLE Payment

CREATE TABLE PurchaseTransaction (
	PurchaseID CHAR (5) PRIMARY KEY NOT NULL CHECK (PurchaseID LIKE 'PD[0-9][0-9][0-9]'),
	TransactionDate DATE,
	StaffID CHAR (5) REFERENCES MsStaff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SupplierID CHAR (5) REFERENCES MsSupplier (SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PaymentID CHAR (5) REFERENCES Payment (PaymentID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
)

SELECT * FROM PurchaseTransaction
DROP TABLE PurchaseTransaction

CREATE TABLE GownType (
	GownTypeID CHAR (5) PRIMARY KEY NOT NULL CHECK (GownTypeID LIKE 'GT[0-9][0-9][0-9]'),
	GownTypeDescription VARCHAR (50) NOT NULL,
	GownTypeName VARCHAR (20) NOT NULL CHECK (GownTypeName IN ('Mermaid Style','A-line','Tea Length','Exaggerated','Empire Waist','Jacket Gown','The Sheath','Ball Gown','Princess Gown','Asymmetrical')),
)

SELECT * FROM GownType
DROP TABLE GownType

CREATE TABLE MsGown (
	GownID CHAR (5) PRIMARY KEY NOT NULL CHECK (GownID LIKE 'GW[0-9][0-9][0-9]'),
	GownColor VARCHAR (10) NOT NULL,
	GownQty INT NOT NULL,
	GownRentPrice NUMERIC (11,2) NOT NULL,
	GownTypeID CHAR (5) REFERENCES GownType (GownTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
)


SELECT * FROM MsGown
DROP TABLE MsGown

CREATE TABLE MsMember (
	MemberID CHAR (5) PRIMARY KEY NOT NULL CHECK (MemberID LIKE 'MM[0-9][0-9][0-9]'),
	MemberName VARCHAR (50) NOT NULL,
	MemberPhone VARCHAR (15) CHECK (MemberPhone LIKE '+62%') NOT NULL,
	MemberGender VARCHAR (10) CHECK (MemberGender LIKE 'Female' OR MemberGender LIKE 'Male') NOT NULL,
	MemberEmail VARCHAR (50) NOT NULL
)

SELECT * FROM MsMember
DROP TABLE MsMember

CREATE TABLE RentTransaction (
	RentID CHAR (5) PRIMARY KEY NOT NULL CHECK (RentID LIKE 'RE[0-9][0-9][0-9]'),
	StartDate DATE,
	ReturnDate DATE,
	StaffID CHAR(5) REFERENCES MsStaff (StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	MemberID CHAR (5) REFERENCES MsMember (MemberID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL
)

SELECT * FROM RentTransaction
DROP TABLE RentTransaction

CREATE TABLE PurchaseDetail (
	PurchaseID CHAR (5) REFERENCES PurchaseTransaction (PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	GownID CHAR (5) REFERENCES MsGown (GownID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseQty INT NOT NULL  CHECK (PurchaseQty <6),
	PRIMARY KEY (PurchaseID,GownID)
)

SELECT * FROM PurchaseDetail
DROP TABLE PurchaseDetail

CREATE TABLE RentDetail (
	RentID CHAR (5) REFERENCES RentTransaction (RentID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	GownID CHAR (5) REFERENCES MsGown (GownID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	RentQty INT NOT NULL CHECK (RentQty <6),
	PRIMARY KEY(RentID, GownID)
)

SELECT * FROM RentDetail
DROP TABLE RentDetail