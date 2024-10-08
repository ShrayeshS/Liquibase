--liquibase formatted sql

--changeset teamA:Alter labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment
ALTER TABLE Customers
ADD Email varchar(255);
--rollback ALTER TABLE Customers; DROP COLUMN Email;