BEGIN TRAN 
ROLLBACK 
COMMIT

--MsMember 
INSERT INTO MsMember
VALUES ('MM001','Daniel Tan','+6287768125667','Male','danieelll@gmail.com'),
('MM002','Donatello','+6287321226789','Male','mcdonaldd@gmail.com'),
('MM003','Evelyn Sienna','+6281281214567','Female','eveeelyn@yahoo.com'),
('MM004','Angelica Tanaka','+6285781888900','Female','Angelic123@gmail.com'),
('MM005','Jiyong Kwon','+6281683686767','Male','xxxibgdrgn@ygent.com'),
('MM006','Lisa Liera','+6287798014343','Female','lierasa@yahoo.com'),
('MM007','Jasmine Tealina','+6285798126790','Female','Jasminetea@ymail.com'),
('MM008','Cheliana Chow','+6287790828124','Female','chelchow@gmail.com'),
('MM009','Jason Key','+6281782823876','Male','kunciiJ@gmail.com'),
('MM010','Mino ','+6286836675664','Male','realmino@ygent.com')

SELECT * FROM MsMember

--MsSupplier
INSERT INTO MsSupplier
VALUES ('VD001','Aimer Zin','+6281683681223','AimerAishi@ymail.com','Japanese street'),
('VD002','Gakari Sekai','+6286894688447','Gakarisekai@ymail.com','Anggrek street'),
('VD003','Justin Bieber','+6281778892476','justinbieber1@gmail.com','JB street'),
('VD004','Devano Joshua','+6287588323443','JoshuaDev@yahoo.com','Pesakih street'),
('VD005','Julie Natasya Dea','+6287790442554','juliedean@gmail.com','Kebon Jeruk street'),
('VD006','Lilya Devaniela','+6280443500556','LilDev68@gmail.com','Haji Senen street'),
('VD007','Gaudia Amy','+6282168322188','gaudia23@ymail.com','Crystal street'),
('VD008','Samuel','+6282212632556','samsamy@yahoo.com','Sesame street'),
('VD009','David Putra','+6288866694553','DavidPut@gmail.com','Puri Indah street'),
('VD010','Jessica J','+6281128145443','JJess@gmail.com','Tanjung Duren street')

SELECT * FROM MsSupplier

--MsStaff
INSERT INTO MsStaff
VALUES ('ST001','Arian Antony','Male',2500000,'varianan@gmail.com','+6212359021','Tanjung street'),
('ST002','Evan Jeremy','Male',2500000,'EvanJeremmm99@ymail.com','+6287768062','Muhammad street'),
('ST003','Olaf Snowman','Male',1500000,'olafkingg@gmail.com','+6257959988','Taj Mahal street'),
('ST004','Selena Menzel','Female',2000000,'selenamen@gmail.com','+6211059090','Asia Pacific street'),
('ST005','Kylie','Female',2000000,'Kylie1234@yahoo.com','+6213259069','Deli Park street'),
('ST006','Anthony Billie','Male',3000000,'antony.bil@gmail.com','+6289359021','Breeze street'),
('ST007','Keiza Audrey Tania','Female',1700000,'kekeeyy@gmail.com','+6256359088','Irian Jaya street'),
('ST008','Jonathan Christie','Male',3000000,'jojochris@ymail.com','+6299359079','Namsan street'),
('ST009','Bella Judith','Female',2000000,'BellaJude@gmail.com','+6212359026','Harajuku street'),
('ST010','Natasha Angelina','Female',1500000,'naaanan@gmail.com','+6212395864','Podomoro street')

SELECT * FROM MsStaff

--GownType
INSERT INTO GownType
VALUES ('GT001','Expands out around the lower legs','Mermaid Style'),
('GT002','Flares gently to the hem','A-line'),
('GT003','Worn to formal event.','Ball Gown'),
('GT004','Dress for indoor tea party','Tea Length'),
('GT005','Dress with extra flamboyance','Exaggerated'),
('GT006','Dress that was cut in long panels','Princess Gown'),
('GT007','Dress with unusual symmetry','Asymmetrical'),
('GT008','Dress with fitted waist','The Sheath'),
('GT009','Dress with waistline right under the bust','Empire Waist'),
('GT010','Dress that overcoat','Jacket Gown')

SELECT * FROM GownType

--MsGown
INSERT INTO MsGown
VALUES ('GW001','Blue',10,500000,'GT002'),
('GW002','Black',8,300000,'GT001'),
('GW003','Pink',9,500000,'GT009'),
('GW004','Maroon',7,300000,'GT003'),
('GW005','Navy',6,400000,'GT004'),
('GW006','White',10,200000,'GT005'),
('GW007','Tosca',11,250000,'GT008'),
('GW008','Black',9,300000,'GT006'),
('GW009','Black',8,300000,'GT007'),
('GW010','Gold',7,900000,'GT010')

SELECT * FROM MsGown

--Payment
INSERT INTO Payment
VALUES ('PY001','OVO',1200000),
('PY002','OVO',750000),
('PY003','OVO',975000),
('PY004','CASH',1500000),
('PY005','GOPAY',1000000),
('PY006','OVO',1000000),
('PY007','BCA',2000000),
('PY008','OVO',2400000),
('PY009','GOPAY',1500000),
('PY010','GOPAY',950000),
('PY011','CASH',2500000), 
('PY012','GOPAY',1000000), 
('PY013','BCA',2500000),
('PY014','BCA',650000),
('PY015','CASH',1000000),
('PY016','OVO',700000),
('PY017','BCA',1100000),
('PY018','OVO',2200000),
('PY019','GOPAY',1300000),
('PY020','GOPAY',150000),
('PY021','CASH',2100000), 
('PY022','GOPAY',1000000), 
('PY023','BCA',2500000),
('PY024','BCA',650000),
('PY025','CASH',1000000)

SELECT * FROM Payment


--PurchaseTransaction
INSERT INTO PurchaseTransaction
VALUES ('PD001','2019-10-09','ST009','VD002','PY012'),
('PD002','2018-02-17','ST008','VD005','PY013'),
('PD003','2019-05-15','ST004','VD009','PY013'), 
('PD004','2016-12-31','ST010','VD010','PY014'),
('PD005','2019-01-01','ST006','VD002','PY002'),
('PD006','2017-02-26','ST010','VD001','PY005'),
('PD007','2018-02-14','ST004','VD004','PY015'),
('PD008','2016-10-08','ST005','VD009','PY010'),
('PD009','2019-11-11','ST001','VD001','PY001'),
('PD010','2019-12-12','ST002','VD004','PY012'),
('PD011','2019-05-21','ST008','VD002','PY011'), 
('PD012','2017-11-22','ST002','VD001','PY004'),
('PD013','2017-02-24','ST001','VD004','PY002'),
('PD014','2016-12-16','ST006','VD001','PY004'),
('PD015','2018-09-30','ST003','VD010','PY009'),
('PD016','2017-02-24','ST008','VD001','PY006'),
('PD017','2018-02-13','ST008','VD003','PY012'),
('PD018','2016-10-04','ST004','VD002','PY011'),
('PD019','2019-11-12','ST002','VD006','PY004'),
('PD020','2019-12-11','ST004','VD008','PY012'),
('PD021','2019-06-20','ST006','VD004','PY010'), 
('PD022','2017-11-21','ST001','VD003','PY005'),
('PD023','2017-02-28','ST002','VD008','PY001'),
('PD024','2016-12-12','ST008','VD002','PY006'),
('PD025','2018-09-30','ST009','VD010','PY008')

SELECT * FROM PurchaseTransaction

--RentTransaction
INSERT INTO RentTransaction
VALUES ('RE001','2019-06-11','2019-06-14','ST003','MM001'),
('RE002','2019-06-16','2019-06-18','ST002','MM001'),
('RE003','2019-02-09','2019-02-12','ST004','MM002'),
('RE004','2019-01-10','2019-01-18','ST001','MM003'),
('RE005','2016-04-15','2016-04-18','ST010','MM009'),
('RE006','2018-07-17','2018-07-20','ST009','MM005'),
('RE007','2018-08-20','2018-08-24','ST005','MM007'),
('RE008','2017-10-10','2017-10-14','ST006','MM006'),
('RE009','2019-01-15','2019-01-17','ST008','MM008'),
('RE010','2017-02-12','2017-02-15','ST001','MM001'),
('RE011','2018-06-28','2018-06-30','ST009','MM004'),
('RE012','2016-05-28','2016-05-31','ST010','MM010'),
('RE013','2018-09-15','2018-09-19','ST002','MM006'),
('RE014','2019-03-01','2019-03-05','ST004','MM008'),
('RE015','2018-11-16','2018-11-19','ST006','MM004'),
('RE016','2018-07-15','2018-07-17','ST009','MM005'),
('RE017','2018-08-18','2018-08-22','ST004','MM007'),
('RE018','2017-10-08','2017-10-10','ST007','MM007'),
('RE019','2019-01-15','2019-01-16','ST002','MM008'),
('RE020','2017-02-12','2017-02-13','ST010','MM003'),
('RE021','2018-06-28','2018-06-29','ST009','MM004'),
('RE022','2016-05-29','2016-05-30','ST010','MM010'),
('RE023','2018-09-18','2018-09-19','ST005','MM003'),
('RE024','2019-03-03','2019-03-05','ST004','MM008'),
('RE025','2018-11-17','2018-11-19','ST006','MM004')

SELECT * FROM RentTransaction

--purchase detail 
INSERT INTO PurchaseDetail
VALUES ('PD001','GW001',3),
('PD002','GW002',4),
('PD003','GW003',5), 
('PD004','GW004',2),
('PD005','GW005',4),
('PD006','GW006',3),
('PD007','GW007',4),
('PD008','GW008',3),
('PD009','GW009',4),
('PD010','GW010',1),
('PD011','GW001',5), 
('PD012','GW002',5),
('PD013','GW007',3),
('PD014','GW004',5),
('PD015','GW003',3),
('PD016','GW003',3),
('PD017','GW003',4),
('PD018','GW008',3),
('PD019','GW009',4),
('PD020','GW010',1),
('PD021','GW001',5), 
('PD022','GW002',5),
('PD023','GW007',3),
('PD024','GW004',5),
('PD025','GW003',3)

SELECT * FROM PurchaseDetail

--rent detail
INSERT INTO RentDetail
VALUES ('RE001','GW010',3),
('RE002','GW009',4),
('RE003','GW008',5),
('RE004','GW007',2),
('RE005','GW006',5),
('RE006','GW005',2),
('RE007','GW004',3),
('RE008','GW003',4), 
('RE009','GW002',4),
('RE010','GW001',5), 
('RE011','GW001',2), 
('RE012','GW002',3),
('RE013','GW007',2),
('RE014','GW008',5),
('RE015','GW009',5),
('RE016','GW003',2),
('RE017','GW004',3),
('RE018','GW007',4), 
('RE019','GW010',4),
('RE020','GW007',5), 
('RE021','GW008',2), 
('RE022','GW003',3),
('RE023','GW007',2),
('RE024','GW008',5),
('RE025','GW009',5)

SELECT * FROM RentDetail