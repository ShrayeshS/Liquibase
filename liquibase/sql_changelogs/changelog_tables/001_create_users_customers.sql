--liquibase formatted sql

--changeset teamA:Creation labels:featureA,Release1,JIRA-101 context:dev,qa
--comment: example comment
CREATE TABLE Customers (
    ID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
--rollback DROP TABLE Customers;