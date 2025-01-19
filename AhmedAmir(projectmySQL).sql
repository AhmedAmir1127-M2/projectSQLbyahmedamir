CREATE TABLE professors (
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    university_shortname VARCHAR(50)
);

CREATE TABLE universities (
    university_shortname VARCHAR(50),
    university_city VARCHAR(100),
    university VARCHAR(255)
);

CREATE TABLE organizations (
    organization_sector VARCHAR(100),
    organization VARCHAR(255)
);

CREATE TABLE affiliations (
    organization VARCHAR(255),
    function VARCHAR(255),
    firstname VARCHAR(100),
    lastname VARCHAR(100)
);

-- Insert data into affiliations
INSERT INTO affiliations
SELECT DISTINCT organization, function, firstname, lastname
FROM university_professors;

-- Insert data into universities
INSERT INTO universities
SELECT DISTINCT university_shortname, university_city, university
FROM university_professors;

-- Insert data into professors
INSERT INTO professors
SELECT DISTINCT firstname, lastname, university_shortname
FROM university_professors;

-- Insert data into organizations
INSERT INTO organizations
SELECT DISTINCT organization_sector, organization
FROM university_professors;


--Check professors Table
SELECT *
FROM professors;

--Check universities Table
SELECT *
FROM universities;

 --Check organizations Table
SELECT *
FROM organizations;

--Check affiliations Table
SELECT *
FROM affiliations;


--Fetch professors working in a specific university
SELECT firstname, lastname
FROM professors
WHERE university_shortname = 'ETH';


--Fetch organizations in a specific sector:
SELECT organization
FROM organizations
WHERE organization_sector = 'Education & Research';

--Count the total number of professors
SELECT COUNT(*) AS total_professors
FROM professors;


--Count the number of universities in each city
SELECT university_city, COUNT(*) AS total_universities
FROM universities
GROUP BY university_city;

--Fetch professors sorted by their last name
SELECT firstname, lastname, university_shortname
FROM professors
ORDER BY lastname ASC;


--Fetch the top 5 organizations with the most affiliations:
SELECT organization, COUNT(*) AS total_affiliations
FROM affiliations
GROUP BY organization
ORDER BY total_affiliations DESC
LIMIT 5;

--Fetch professors affiliated with multiple organizations
SELECT firstname, lastname, COUNT(DISTINCT organization) AS total_organizations
FROM affiliations
GROUP BY firstname, lastname
HAVING COUNT(DISTINCT organization) > 1;




--Fetch universities that do not have any professors:
SELECT university_shortname, university, university_city
FROM universities
WHERE university_shortname NOT IN (
    SELECT DISTINCT university_shortname
    FROM professors
);


-- List professors along with their university details
SELECT p.firstname, p.lastname, u.university, u.university_city
FROM professors p
INNER JOIN universities u
ON p.university_shortname = u.university_shortname;

-- List affiliations of professors along with their organization details
SELECT a.firstname, a.lastname, a.function, o.organization, o.organization_sector
FROM affiliations a
INNER JOIN organizations o
ON a.organization = o.organization;


-- List professors with their affiliations and the universities they belong to.
SELECT p.firstname, p.lastname, u.university, u.university_city, a.function, a.organization
FROM professors p
INNER JOIN universities u
ON p.university_shortname = u.university_shortname
INNER JOIN affiliations a
ON p.firstname = a.firstname AND p.lastname = a.lastname;

--Fetch the number of professors per university, sorted by the highest number
SELECT u.university, COUNT(p.firstname) AS total_professors
FROM universities u
LEFT JOIN professors p
ON u.university_shortname = p.university_shortname
GROUP BY u.university
ORDER BY total_professors DESC;


-- Add a Primary Key to universities
ALTER TABLE universities
ADD CONSTRAINT pk_universities PRIMARY KEY (university_shortname);


--Add Foreign Key to professors referencing universities
ALTER TABLE professors
ADD CONSTRAINT fk_professors_universities
FOREIGN KEY (university_shortname)
REFERENCES universities(university_shortname)
ON DELETE CASCADE
ON UPDATE CASCADE;

--Cascade Delete: Removing a university also removes associated professors
DELETE FROM universities
WHERE university_shortname = 'EPF';

-- Check professors table to ensure no professors are left with 'EPF' university_shortname
SELECT *
FROM professors
WHERE university_shortname = 'EPF';

-- Check universities table to ensure the university 'EPF' has been deleted
SELECT *
FROM universities
WHERE university_shortname = 'EPF';


--Update Cascade: Updating an organization name updates all affiliations.
UPDATE organizations
SET organization = 'New Organization Name'
WHERE organization = 'L3S Advisory Board';

--Check the organizations table to verify that the organization name has been updated:
SELECT *
FROM organizations
WHERE organization = 'New Organization Name';

--Check the affiliations table to verify that the organization name has been updated for all affiliations related to the old organization name:
SELECT *
FROM affiliations
WHERE organization = 'New Organization Name';


















