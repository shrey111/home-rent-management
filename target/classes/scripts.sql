CREATE DATABASE rentHome;

USE rentHome;

CREATE TABLE coordinates (
    id INT NOT NULL AUTO_INCREMENT,
    longitude DOUBLE,
    latitude DOUBLE,
    PRIMARY KEY (id)
);

CREATE TABLE rentDetails (
    id INT NOT NULL AUTO_INCREMENT,
    coordinates_id INT NOT NULL,
    rent INT NOT NULL,
    rentDate Date,
    PRIMARY KEY (id),
    FOREIGN KEY (coordinates_id) REFERENCES coordinates(id)
);

CREATE INDEX idx_coordinateId
ON coordinates (id);

CREATE INDEX idx_rentDetailsId
ON rentDetails (id);

INSERT INTO coordinates (id,longitude,latitude) VALUES ( 1,'42.30985169999999', '-83.05519340000001');

INSERT INTO coordinates (id,longitude,latitude) VALUES ( 1,'42.3095373', '-83.05489820000003');

INSERT INTO coordinates (id,longitude,latitude) VALUES ( 1,'42.3090219', '-83.05752610000002');




--
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 1, 1, 400,CURDATE() );
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 2, 1, 300,NOW() - INTERVAL 1 MONTH );
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 3, 1, 200,NOW() - INTERVAL 2 MONTH);
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 4, 2, 500,CURDATE() );
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 5, 2, 600,CURDATE() -30);
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 6, 2, 400,CURDATE() -60);
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 7, 3, 700,CURDATE() );
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 8, 3, 250,CURDATE() -30);



SHOW CREATE TABLE coordinates;

select * from coordinates;


select * from rentDetails;

