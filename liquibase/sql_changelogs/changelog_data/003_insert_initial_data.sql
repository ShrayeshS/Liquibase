--liquibase formatted sql

--changeset teamA:Initial_data1 labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment
INSERT INTO Customers (ID, LastName, FirstName, Address, City, Email)
VALUES (1, 'James', 'Smith', 'Avocado Ave', 'Washington', 'james.smith@abc.com');
--rollback DELETE FROM Customers WHERE ID = 1 ;

--changeset teamA:Initial_data2 labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment
INSERT INTO Customers (ID, LastName, FirstName, Address, City, Email)
VALUES (2, 'Noah', 'Walter', 'Mauna Lani Dr', 'Scottsdale', 'n.walter@abc.com');
--rollback DELETE FROM Customers WHERE ID = 2 ;

--changeset teamA:Initial_data3 labels:featureA,Release1,JIRA-101 context:dev
--comment: example comment
INSERT INTO Customers (ID, LastName, FirstName, Address, City, Email)
VALUES (3, 'Dan', 'Butler', 'Avocado Ave', 'Koloa', 'd.butler@abc.com');
--rollback DELETE FROM Customers WHERE ID = 3 ;