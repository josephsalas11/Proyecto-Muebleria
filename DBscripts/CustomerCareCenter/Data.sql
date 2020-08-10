INSERT INTO city(idCity, province, city,coordinates)
VALUES (1,'Cartago','San Rafael',ST_GeomFromText('POINT(9.869835 -83.904305)')),
(2,'Cartago','Tejar',ST_GeomFromText('POINT(9.842911 -83.950090)')),
(3,'San Jose','San Pedro',ST_GeomFromText('POINT(9.934134 -84.052551)')),
(4,'San Jose','Sabana',ST_GeomFromText('POINT(9.935592 -84.100445)')),
(5,'Alajuela','Palmares',ST_GeomFromText('POINT(10.055801 -84.432867)')),
(6,'Alajuela','Alajuela',ST_GeomFromText('POINT(10.014725 -84.213462)'));