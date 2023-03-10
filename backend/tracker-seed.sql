-- DROP DATABASE clients_tracker;
-- CREATE DATABASE clients_tracker;

-- \connect clients_tracker

\i backend/tracker-schema.sql

INSERT INTO statuses (name)
VALUES ('Initial Contact'), 
       ('Information Session'), 
       ('Onsite Visit'), 
       ('Applying for Green Card'),
       ('Applying for Medicaid'),
       ('Daycare Application Submission'), 
       ('Phone Screening'),
       ('Interview'),
       ('Daycare Application Approved'), 
       ('Daycare Application Denied'),
       ('Daycare Application Appealing'),
       ('Enrolled'),
       ('Not To Proceed');

INSERT INTO channels (name)
VALUES ('Search engine'), 
       ('Social media'), 
       ('Blog or publication'),
       ('Store ads'),
       ('Word of mouth'),
       ('Newspaper'),
       ('Vehicle ads'),
       ('Referral');

INSERT INTO users (email, password, first_name, last_name, role)
VALUES ('admin@test.com', 
        '$2b$12$7xsRpb4hvFZGSCmVgqWFk.bCnJfWJggBfIP1jZsKt1mW91urR3Gby', 
        'Admin', 
        'User', 
        'admin'),
        ('editor@test.com', 
        '$2b$12$7xsRpb4hvFZGSCmVgqWFk.bCnJfWJggBfIP1jZsKt1mW91urR3Gby', 
        'Editor', 
        'User', 
        'editor'),
        ('viewer@test.com', 
        '$2b$12$7xsRpb4hvFZGSCmVgqWFk.bCnJfWJggBfIP1jZsKt1mW91urR3Gby', 
        'Viewer', 
        'User', 
        'viewer');

INSERT INTO clients (first_name, last_name, dob, email, phone, address, citizenship, medicaid, daycare, from_channel, current_status, created_at)
VALUES ('Odille', 
        'Miskin', 
        '03/21/1968',
        'omiskin0@npr.org', 
        '288-731-3030',
        '2825 Forest Dale Court', 
        'U.S. Citizen',
        TRUE,
        TRUE,
        1, 
        1,
        '12/22/2022'
        ),
        ('Marni', 
        'Samme', 
        '08/03/1950',
        'msamme1@printfriendly.com', 
        '549-245-9927',
        '34 Scoville Place', 
        'Green Card Holder',
        FALSE,
        FALSE,
        5, 
        2,
        '01/03/2023'
        ),
       ('Hubie', 
        'Collerd', 
        '11/14/1973',
        'hcollerd2@com.com', 
        '549-245-9927',
        '517 Mccormick Place', 
        'U.S. Citizen',
        TRUE,
        FALSE,
        3, 
        3,
        '09/03/2022'
        ),
        ('Andriana', 
        'Lawlie', 
        '05/13/1952',
        'alawlie5@tiny.cc', 
        '395-980-998',
        '5 Haas Crossing', 
        'None',
        FALSE,
        FALSE,
        4, 
        2,
        '02/01/2023'
        );


INSERT INTO clients_statuses (client_id, status_id, update_date)
VALUES (1, 1, '12/22/2022'), 
       (2, 1, '01/03/2023'),
       (2, 2, '01/15/2023'),
       (3, 1, '09/03/2022'),
       (3, 2, '11/13/2022'),
       (3, 3, '11/21/2022'),
       (4, 1, '02/01/2023'),
       (4, 2, '02/03/2023');

INSERT INTO updates (user_id, client_id, comment)
VALUES (1, 1, 'The potential client would like to schedule an onsite visit after discussing with his family'),
       (2, 2, 'The potential client has no medicaid but is considering self-pay option'),
       (1, 3, 'He is asking information for his blind dad'),
       (2, 4, 'Low probability of enrolling in our program')