CREATE TABLE employee
  (
     id          BIGINT IDENTITY(1, 1) PRIMARY KEY,
     firstname   VARCHAR (20) DEFAULT NULL,
     lastname    VARCHAR (25) NOT NULL,
     email       VARCHAR (100) NOT NULL,
     phonenumber VARCHAR (20) DEFAULT NULL
  );

INSERT INTO employee
VALUES      ('PAPARAO',
             'trainer',
             'trainer1@gmail.com',
             '555-666-7777'),
            ( 'Prakash',
              'HRHead',
              'hrhead1@gmail.com',
              '222-666-7777'),
            ('Senthil',
             'HRExecutive',
             'hrexecutive@gmail.com',
             '333-555-7777')

SELECT *
FROM   employee