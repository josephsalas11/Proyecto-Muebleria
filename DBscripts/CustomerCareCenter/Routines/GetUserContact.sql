DELIMITER $$
CREATE PROCEDURE `GetUserContact`()
BEGIN
    SELECT u.idUser                                  AS Id,
           CONCAT(u.`name`, ' ', u.lastname)         AS Usuario,
           GROUP_CONCAT(c.`value` SEPARATOR '  &  ') AS Contacto
    FROM `User` u
             INNER JOIN user_contact c ON (u.idUser = c.idUser)
    WHERE u.birthdate = date(now())
      AND c.idType = 1
    GROUP BY u.idUser, CONCAT(u.`name`, ' ', u.lastname)
    ORDER BY u.idUser, CONCAT(u.`name`, ' ', u.lastname);
END$$
DELIMITER ;