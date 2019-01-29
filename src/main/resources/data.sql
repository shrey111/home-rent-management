
--Populating coordinates
INSERT INTO coordinates (id,longitude,latitude,address) VALUES ( 1,'42.30985169999999', '-83.05519340000001', '"431 Curry Ave, Windsor, ON N9B 2B8, Canada"');
INSERT INTO coordinates (id,longitude,latitude,address) VALUES ( 2,'42.3095373', '-83.05489820000003', '"461 Curry Ave, Windsor, ON N9B 2B8, Canada"');
INSERT INTO coordinates (id,longitude,latitude,address) VALUES ( 3,'42.3090219', '-83.05752610000002', '"437 Campbell Ave, Windsor, ON N9B 2H5, Canada"');

--Populating rents
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 1, 1, 400,CURDATE() );
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 2, 1, 300,CURDATE() - INTERVAL 1 MONTH );
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 3, 1, 200,CURDATE() - INTERVAL 2 MONTH);
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 4, 2, 500,CURDATE() );
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 5, 2, 600,CURDATE() - INTERVAL 1 MONTH);
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 6, 2, 400,CURDATE() - INTERVAL 2 MONTH);
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 7, 3, 700,CURDATE() );
--INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 8, 3, 250,CURDATE() - INTERVAL 1 MONTH);

INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 1, 1, 400, '"03/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 2, 1, 300, '"02/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 3, 1, 200, '"01/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 4, 2, 500, '"03/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 5, 2, 600, '"02/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 6, 2, 400, '"01/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 7, 3, 700, '"03/14/2018"');
INSERT INTO rentDetails (id, coordinates_id,rent,rentDate) VALUES ( 8, 3, 250, '"02/14/2018"');