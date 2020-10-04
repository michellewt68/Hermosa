--1
SELECT [Member ID] = mm.MemberID,
[Member Name] = mm.MemberName,
[Total Rent Quantity] = SUM (RentQty)
FROM MsMember mm JOIN RentTransaction rt ON mm.MemberID = rt.MemberID
JOIN RentDetail rd ON rd.RentID = rt.RentID
WHERE MONTH(StartDate) = 6
GROUP BY mm.MemberID, mm.MemberName

--2
SELECT ms.StaffID, StaffName, [Total Purchase Transacion] = COUNT(pt.PurchaseID)
FROM MsStaff ms JOIN PurchaseTransaction pt ON ms.StaffID = pt.StaffID
JOIN Payment p ON p.PaymentID = pt.PaymentID
WHERE p.PaymentAmount >1000000
AND	MONTH(pt.TransactionDate) = 5
GROUP BY MS.StaffID, MS.StaffName

--3

SELECT [Member Name] = 'Mrs. ' + mm.MemberName,
[Renting Cost] = (DATEDIFF (DAY,StartDate,ReturnDate))* SUM(mg.GownRentPrice),
[Total Gown Rented] = COUNT(rd.RentID)
FROM MsMember mm JOIN RentTransaction rt ON mm.MemberID = rt.MemberID
JOIN RentDetail rd ON rt.RentID = rd.RentID
JOIN MsGown mg ON rd.GownID = mg.GownID
WHERE mm.MemberGender = 'Female' AND DAY(rt.StartDate) = 15
GROUP BY mm.MemberName, rt.ReturnDate, rt.StartDate,mg.GownRentPrice,rd.RentQty
UNION
SELECT [Member Name] = 'Mr. ' + mm.MemberName,
[Renting Cost] =  (DATEDIFF (DAY,StartDate,ReturnDate))* SUM(mg.GownRentPrice),
[Total Gown Rented] = COUNT(rd.RentID)
FROM MsMember mm JOIN RentTransaction rt ON mm.MemberID = rt.MemberID
JOIN RentDetail rd ON rt.RentID = rd.RentID
JOIN MsGown mg ON rd.GownID = mg.GownID
WHERE mm.MemberGender = 'Male' AND DAY(rt.StartDate) = 15
GROUP BY mm.MemberName, rt.ReturnDate,rt.StartDate,mg.GownRentPrice,rd.RentQty

--4 (cara ke1) pakai alias subquery
SELECT ms.StaffID, [First Name] = LEFT (ms.StaffName,CHARINDEX(' ', ms.StaffName)),
[Total Purchasing Amount] = SUM(p.PaymentAmount)
FROM MsStaff ms JOIN PurchaseTransaction pt ON ms.StaffID = pt.StaffID 
JOIN Payment p ON pt.PaymentID = p.PaymentID,
(
	SELECT Already = COUNT (ptt.PurchaseID)
	FROM PurchaseTransaction ptt
	WHERE ptt.StaffID = 'ST001'
) AS newTable
WHERE ms.StaffID = 'ST001' AND NewTable.Already>1
GROUP BY ms.StaffID,ms.StaffName

-- 4 (Cara kedua)
SELECT PT.StaffID,[First Name]=SUBSTRING(StaffName,1,CHARINDEX(' ',StaffName,1+1)),
[Total Purchasing Amount]=SUM(PaymentAmount)
FROM MsStaff MS
JOIN PurchaseTransaction PT ON PT.StaffID=MS.StaffID
JOIN Payment P ON P.PaymentID=PT.PaymentID
WHERE PT.StaffID='ST001' AND SupplierID between 'VD001' AND 'VD010'
GROUP BY PT.StaffID,StaffName

--5
SELECT StaffID, StaffName, [Staff Gender] = LEFT (ms.StaffGender,1), 
[Staff Salary] = 'Rp. ' + CAST (ms.StaffSalary AS varchar)
FROM MsStaff ms,
(
	SELECT avgnum = AVG(mss.StaffSalary)
	FROM MsStaff mss
) AS newTable
WHERE ms.StaffSalary > newTable.avgnum AND ms.StaffName LIKE 'A%'
ORDER BY StaffID DESC

--6
SELECT mg.GownID,  [Rented Total Times] = CAST(COUNT(rt.RentID) AS VARCHAR) + ' time(s)',
GownColor, gt.GownTypeName, [Description Length] = LEN (gt.GownTypeDescription) 
FROM MsGown mg JOIN GownType gt ON mg.GownTypeID = gt.GownTypeID 
JOIN RentDetail rd ON rd.GownID = mg.GownID 
JOIN RentTransaction rt ON rt.RentID = rd.RentID,
(
	SELECT avglength = AVG (LEN(GownTypeDescription))
	FROM GownType
) AS newTable 
WHERE LEN(gt.GownTypeDescription) < newTable.avglength AND 
MONTH(rt.ReturnDate) = 6
GROUP BY mg.GownID, mg.GownColor, gt.GownTypeName, gt.GownTypeDescription

--7
SELECT [Gown Number] = REPLACE (mg.GownID, 'GW','Gown'), gt.GownTypeName,
[Gown Rent Price] = 'Rp. ' + CAST (mg.GownRentPrice AS VARCHAR),
[Gown Rented Times] = SUM(rd.RentQty)
FROM MsGown mg JOIN GownType gt ON mg.GownTypeID = gt.GownTypeID
JOIN RentDetail rd ON rd.GownID = mg.GownID 
JOIN RentTransaction rt ON rt.RentID = rd.RentID,
(
	SELECT avgprice = AVG (mgg.GownRentPrice)
	FROM MsGown mgg
) AS NewTable 
WHERE mg.GownRentPrice > NewTable.avgprice AND MONTH(rt.StartDate) = 6
GROUP BY mg.GownID, gt.GownTypeName, mg.GownRentPrice
ORDER BY mg.GownID ASC

--8
SELECT [Purchase Date] = CONVERT(VARCHAR, TransactionDate, 107),
[Staff Number] = REPLACE (ms.StaffID,'ST','Staff'),
pt.PurchaseID, p.PaymentID, [Payment Amount] = 'Rp. ' + CAST(p.PaymentAmount AS VARCHAR),
[Total Gown Rented] = SUM(rd.RentQty)
FROM PurchaseTransaction pt JOIN MsStaff ms ON ms.StaffID = pt.StaffID
JOIN Payment p ON p.PaymentID = pt.PaymentID
JOIN RentTransaction rt ON rt.StaffID = ms.StaffID
JOIN RentDetail rd ON rd.RentID = rt.RentID,
(
	SELECT highest = MAX(pp.PaymentAmount)
	FROM Payment pp
) AS NewTable 
WHERE p.PaymentAmount = NewTable.highest AND 
MONTH (pt.TransactionDate) = 5
GROUP BY TransactionDate, ms.StaffID, pt.PurchaseID, 
p.PaymentID, p.PaymentAmount

--9
BEGIN TRAN 
ROLLBACK 

CREATE VIEW MemberTotalTransaction 
AS 
SELECT mm.MemberID, mm.MemberName, [Total Rent] = COUNT(rt.RentID),
[Total Purchase Amount] = SUM (mg.GownRentPrice) *	DATEDIFF(DAY,StartDate,ReturnDate)
FROM MsMember mm JOIN RentTransaction rt ON rt.MemberID = mm.MemberID
JOIN RentDetail rd ON rd.RentID = rt.RentID  
JOIN MsGown mg on mg.GownID = rd.GownID
WHERE mm.MemberID = 'MM001' AND DATEDIFF(DAY,rt.StartDate,rt.ReturnDate)>0
GROUP BY mm.MemberID, mm.MemberName, rt.RentID, mg.GownRentPrice, 
rt.ReturnDate, rt.StartDate

SELECT * FROM MemberTotalTransaction
DROP VIEW MemberTotalTransaction
--10

BEGIN TRAN 
ROLLBACK

CREATE VIEW StaffInvolvement
AS
SELECT ms.StaffID, ms.StaffName, 
[Staff Purchase Involvement] = COUNT (pt.PurchaseID),
[Staff Total Expense] = SUM (p.PaymentAmount)
FROM MsStaff ms JOIN PurchaseTransaction pt ON pt.StaffID = ms.StaffID
JOIN Payment p ON p.PaymentID = pt.PaymentID
WHERE MONTH (pt.TransactionDate) = 5
GROUP BY ms.StaffID, ms.StaffName
HAVING SUM (p.PaymentAmount) > 1000000


SELECT * FROM StaffInvolvement























