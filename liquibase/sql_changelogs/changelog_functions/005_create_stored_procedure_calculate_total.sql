--liquibase formatted sql

--changeset teamA:Stored_Proc labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment

CREATE PROCEDURE InsertCustomer
    @CustomerId INT,
    @CustomerLastName NVARCHAR(50),
    @CustomerFirstName NVARCHAR(50),
    @CustomerAddress NVARCHAR(50),
    @CustomerCity NVARCHAR(50),
    @CustomerEmail NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customers (ID, LastName, FirstName, Address, City, Email)
    VALUES (@CustomerId, @CustomerLastName, @CustomerFirstName, @CustomerAddress, @CustomerCity, @CustomerEmail);
END


--rollback DROP PROCEDURE InsertCustomer;