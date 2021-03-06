drop Table WorkOn;
drop Table WineLabelForms;
drop Table GovernmentAgents;
drop Table WineCompanyReps;
drop Table Wines;
drop Table Accounts;
drop sequence ttbID_seq;
drop sequence repID_seq;
drop sequence wineID_seq;
drop sequence formID_seq;

Create Table Accounts(
    loginName VARCHAR(25),
    password VARCHAR(25),
    role VARCHAR(20),
    CONSTRAINT Accounts_PK Primary Key(loginName),
    CONSTRAINT Accounts_UK UNIQUE (loginName, role),
    CONSTRAINT AccountsRoleVal check (Role in ('GA', 'WCR'))
);

Create Table GovernmentAgents(
    loginName VARCHAR(25),
    ttbID number,
    isSuper number(1),
    name VARCHAR(25),
    emailAddress Varchar(50),
    phone VARCHAR(15),
    role VARCHAR(20) default 'GA',
    CONSTRAINT GA_PK Primary Key (loginName),
    CONSTRAINT GA_FK1 Foreign key (loginName, role) references Accounts (loginName, role) on Delete Cascade,
    CONSTRAINT GARoleVal check (Role in ('GA')),
    CONSTRAINT GA_UK Unique (ttbID)
);

create sequence ttbID_seq
start with 100
increment by 1;

Create Table WineCompanyReps(
    loginName VARCHAR(25),
    repID number,
    name VARCHAR(25),
    emailAddress VARCHAR(50),
    phone VARCHAR(15),
    companyName VARCHAR(25),
    role VARCHAR(20) default 'WCR',
    CONSTRAINT WCR_PK Primary Key (loginName),
    CONSTRAINT WCR_FK1 Foreign key (loginName, role) references Accounts (loginName, role) on Delete Cascade,
    CONSTRAINT WCRRoleVal check (Role in ('WCR')),
    CONSTRAINT WCR_UK Unique (repID)
);

create sequence repID_seq
start with 100
increment by 1;

Create Table Wines (
    wineID number, 
    brandName VARCHAR(25), 
    class VARCHAR(25), 
    alcoholContent NUMBER(3,1),
    appellation VARCHAR(25), 
    netContent NUMBER(5,1), 
    bottlerName VARCHAR(25),
    CONSTRAINT Wines_PK Primary Key(wineID)
);
create sequence wineID_seq
start with 100
increment by 1;

Create Table WineLabelForms (
    formID number, 
    dateSubmitted Date, 
    dateRejected Date, 
    dateApproved Date,
    status Varchar(25), 
    vintage number(4,0), 
    currentReviewerID number, 
    wineID number, 
    GA_loginName Varchar(25), 
    WCR_loginName Varchar(25),
    CONSTRAINT WLF_PK Primary Key (formID),
    CONSTRAINT WLF_KF2 Foreign key (GA_loginName) references GovernmentAgents(loginName),
    CONSTRAINT WLF_KF3 Foreign key (WCR_loginName) references WineCompanyReps(loginName),
    CONSTRAINT WLF_KF4 Foreign key (currentReviewerID) references GovernmentAgents(ttbID)
);

create sequence formID_seq
start with 100
increment by 1;

Create Table WorkOn(
    dateBegin Date, 
    formID number,
    comments varchar(100),
    CONSTRAINT WO_PK Primary Key (formID),
    CONSTRAINT WO_FK Foreign key (formID) references WineLabelForms(formID) ON Delete Cascade
); 

--Accounts
INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('j1', 'SZE9AjUn', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('w1', '6dgfXEn2', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('g1', 'MkpBZDr2', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('i1', 'e29LWpSs', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('t1', '3v5d7ATp', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('j2', 'fX8SZWGv', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('s1', 'EfGMDRbU', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('j3', '8d4hxnC7', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('w2', 'cx9LHa5b', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('b1', 'dL5mQqZX', 'GA');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('E1', 'FBajjbae', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('G2 ', '4FkYKDGD', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('V1 ', 'W9LhpSMx', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('S1', 'xuD5LZmx', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('C1', 'ncpLV4tW', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('E2', 'VKfE4VqS', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('G3', 'a2K4tXtS', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('A2', 'TtpY9Npk', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('B2', 'p3ZN8jfh', 'WCR');

INSERT INTO ACCOUNTS (LOGINNAME, PASSWORD, ROLE) 
VALUES ('D1', 'gNGJjLGG', 'WCR');

-- TTB
INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('j1', TTBID_seq.nextval, 1.0, 'Jerry', 'Jerry@gmail.com', '(673) 243-8128', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('w1', TTBID_seq.nextval, 0.0, 'Wentao', 'Wentao@gmail.com', '(463) 867-3638', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('g1', TTBID_seq.nextval, 0.0, 'Grey', 'Grey@gmail.com', '(848) 586-3839', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('i1', TTBID_seq.nextval, 1.0, 'Ice', 'Ice@gmail.com', '(843) 860-6292', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('t1', TTBID_seq.nextval, 0.0, 'Tommy', 'Tommy@gmail.com', '(431) 910-5383', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('j2', TTBID_seq.nextval, 1.0, 'Johnny', 'Johnny@gmail.com', '(266) 813-0137', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('s1', TTBID_seq.nextval, 1.0, 'Sherry', 'Sherry@gmail.com', '(969) 933-0133', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('j3', TTBID_seq.nextval, 1.0, 'Jin', 'Jin@gmail.com', '(720) 489-8784', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('w2', TTBID_seq.nextval, 1.0, 'Wong', 'Wong@gmail.com', '(741) 891-4895', 'GA');

INSERT INTO GOVERNMENTAGENTS (LOGINNAME, TTBID, ISSUPER, NAME, EMAILADDRESS, PHONE, ROLE) 
VALUES ('b1', TTBID_seq.nextval, 0.0, 'Bill', 'Bill@gmail.com', '(850) 757-7678', 'GA');

--WCR
INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('E1', REPID_SEQ.nextval, 'Ethyl', 'Ethyl@gmail.com', '(952) 631-8519', 'Smart Records', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('G2 ', REPID_SEQ.nextval, 'Gladys', 'Gladys@gmail.com', '(806) 239-5005', 'World Microsystems', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('V1 ', REPID_SEQ.nextval, 'Veronica', 'Veronica@gmail.com', '(496) 686-9723', 'Buck ', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('S1', REPID_SEQ.nextval, 'Susann', 'Susann@gmail.com', '(466) 352-0047', 'Smilectronics', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('C1', REPID_SEQ.nextval, 'Cecily', 'Cecily@gmail.com', '(694) 321-8613', 'Spectertainment', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('E2', REPID_SEQ.nextval, 'Elisa', 'Elisa@gmail.com', '(777) 387-3653', 'Marsoftwares', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('G3', REPID_SEQ.nextval, 'Gilbert', 'Gilbert@gmail.com', '(714) 890-3809', 'Starecords', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('A2', REPID_SEQ.nextval, 'Ali', 'Ali@gmail.com', '(620) 266-2346', 'Yellowmart', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('B2', REPID_SEQ.nextval, 'Brigette', 'Brigette@gmail.com', '(961) 303-2896', 'Omegadale', 'WCR');

INSERT INTO WINECOMPANYREPS (LOGINNAME, REPID, NAME, EMAILADDRESS, PHONE, COMPANYNAME, ROLE) 
VALUES ('D1', REPID_SEQ.nextval, 'Dante', 'Dante@gmail.com', '(972) 802-1615', 'Karmaworks', 'WCR');

--Wines
INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Raeburn Chardonnay ', 'White', 14.0, 'Russian River Valley, CA', 750.0, 'Raeburn');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Dominus Estate', 'Red Wine', 14.5, 'Napa Valley, CA', 750.0, 'Dominus Estate');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Chateau Lafleur', 'Red Wine', 13.0, 'Pomerol, France', 750.0, 'Chateau La Fleur de Gay');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Gruet Brut', 'Sparkling Wine', 12.0, 'Albuquerque, NM', 750.0, 'Gruet Winery');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Adelsheim Pinot Noir', 'Pinot Noir ', 13.5, 'Willamette Valley, OR ', 750.0, 'Adelsheim Winery');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Antinori Tignanello', 'Red Wine', 14.0, 'Tuscany, Italy ', 750.0, 'Antinori T. Tignanello');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Chateau Angelus', 'Red Wine', 13.0, 'Saint-Emilion, France', 750.0, 'Chateau Angelus');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Pegasus Bay Pinot Noir', 'Pinot Noir', 13.9, 'Wairarapa, NZ', 750.0, 'Donaldson Family');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'Joseph Phelps Insignia', 'Red Wine', 14.0, 'Napa Valley, CA', 750.0, 'Joseph Phelps Vineyards');

INSERT INTO WINES (WINEID, BRANDNAME, CLASS, ALCOHOLCONTENT, APPELLATION, NETCONTENT, BOTTLERNAME) 
VALUES (WINEID_SEQ.NEXTVAL, 'DeLille D2 Estate Red', 'Red Wine', 14.3, 'Columbia Valley, WA', 750.0, 'Delille Chateau');

--Label Forms 
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('17-May-2018', 'DD-MON-RR'),to_date('20-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1956.0,101.0,101.0,'w1','E1');
--Row 2
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('18-May-2018', 'DD-MON-RR'),to_date('21-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1970.0,102.0,102.0,'g1','G2 ');
--Row 3
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('19-May-2018', 'DD-MON-RR'),to_date('22-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1988.0,103.0,103.0,'i1','V1 ');
--Row 4
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('20-May-2018', 'DD-MON-RR'),to_date('23-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',2001.0,104.0,104.0,'t1','S1');
--Row 5
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('21-May-2018', 'DD-MON-RR'),to_date('24-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1972.0,105.0,105.0,'j2','C1');
--Row 6
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('22-May-2018', 'DD-MON-RR'),to_date('25-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1978.0,106.0,106.0,'s1','E2');
--Row 7
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('23-May-2018', 'DD-MON-RR'),to_date('26-Aug-2018', 'DD-MON-RR'),NULL,'Rejected',1978.0,107.0,107.0,'j3','G3');
--Row 8
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('24-May-2018', 'DD-MON-RR'),NULL,to_date('26-Aug-2018', 'DD-MON-RR'),'Approved',1958.0,108.0,108.0,'w2','A2');
--Row 9
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('25-May-2018', 'DD-MON-RR'),NULL,to_date('27-Aug-2018', 'DD-MON-RR'),'Approved',1970.0,109.0,109.0,'b1','B2');
--Row 10
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('26-May-2017', 'DD-MON-RR'),NULL,to_date('28-Aug-2018', 'DD-MON-RR'),'Approved',1988.0,105.0,101.0,'j2','D1');
--Row 11
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('27-May-2017', 'DD-MON-RR'),NULL,to_date('29-Aug-2018', 'DD-MON-RR'),'Approved',2001.0,102.0,102.0,'g1','E1');
--Row 12
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('28-May-2017', 'DD-MON-RR'),NULL,to_date('30-Aug-2018', 'DD-MON-RR'),'Approved',1972.0,103.0,103.0,'i1','G2 ');
--Row 13
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('29-May-2017', 'DD-MON-RR'),NULL,to_date('31-Aug-2018', 'DD-MON-RR'),'Approved',2001.0,105.0,104.0,'j2','V1 ');
--Row 14
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('30-May-2017', 'DD-MON-RR'),NULL,to_date('01-Sep-2018', 'DD-MON-RR'),'Approved',1968.0,104.0,105.0,'t1','S1');
--Row 15
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('31-May-2013', 'DD-MON-RR'),NULL,to_date('02-Sep-2018', 'DD-MON-RR'),'Approved',1998.0,102.0,106.0,'g1','C1');
--Row 16
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('01-Jun-2017', 'DD-MON-RR'),NULL,to_date('03-Sep-2018', 'DD-MON-RR'),'Approved',1990.0,103.0,107.0,'i1','E2');
--Row 17
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('02-Jun-2012', 'DD-MON-RR'),NULL,to_date('04-Sep-2018', 'DD-MON-RR'),'Approved',1988.0,103.0,108.0,'i1','G3');
--Row 18
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('03-Jun-2017', 'DD-MON-RR'),NULL,to_date('05-Sep-2018', 'DD-MON-RR'),'Approved',2002.0,107.0,109.0,'j3','A2');
--Row 19
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('04-Jun-2016', 'DD-MON-RR'),NULL,to_date('06-Sep-2018', 'DD-MON-RR'),'Approved',2006.0,105.0,102.0,'j2','B2');
--Row 20
INSERT INTO WINELABELFORMS (FORMID, DATESUBMITTED, DATEREJECTED, DATEAPPROVED, STATUS, VINTAGE, CURRENTREVIEWERID, WINEID, GA_LOGINNAME, WCR_LOGINNAME) VALUES (FORMID_SEQ.NEXTVAL,to_date('05-Jun-2014', 'DD-MON-RR'),NULL,to_date('07-Sep-2018', 'DD-MON-RR'),'Approved',2006.0,105.0,103.0,'j3','D1');

Select * from Accounts;
Select * from Governmentagents;
Select * from winecompanyreps;
Select * from wines;
select * from winelabelforms;
