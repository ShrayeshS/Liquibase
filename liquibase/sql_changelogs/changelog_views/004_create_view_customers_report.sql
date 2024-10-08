--liquibase formatted sql

--changeset teamA:Create_View labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment
CREATE VIEW [Washington Customers] AS
SELECT FirstName, LastName
FROM Customers
WHERE City = 'Washington';

--rollback DROP VIEW [Washington Customers];
