USE Workshop;

------------------------- CATEGORIAS -------------------------
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (1, 'Sala',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Salas, Sofás, Mesas de Centro, Muebles de Bar, Muebles de TV y Alfombras.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (2, 'Comedor',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Comedor, Mesas de Comedor, Barstools, Sillas y Bancos, Bufeteras.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (3, 'Dormitorio',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Mueble de Dormitorios, Mesas de Noche, Gaveteros, Camas y Colchones.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (4, 'Oficina',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Oficina, Escritorios, Estanterías, Sillas de Oficina.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (5, 'Exterior',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Exteriores, Terraza y Intemperie.',
        1);


------------------------- PRODUCTOS -------------------------
-- Productos de Sala
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (1, 1, N'Sofá Reclinable Vanessa Tela', N'Medidas: 99X94X99cm Color: Café Claro y Gris Claro',
        'https://www.alteadesign.com/9594-large_default/sofa-reclinable-vanessa-tela.jpg', '2020-01-25', 200, 499, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (2, 1, N'Sofá Russi 2 Puestos Gris', 'Medidas: 140 x 87 x 84 cm Material: Tela',
        'https://www.alteadesign.com/10492-large_default/sofa-russi-2-puestos-azul.jpg', '2020-01-25', $200, $489, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (3, 1, N'Sofá Russi 3 Puestos Azul', 'Medidas 184 x 87 x 84 cm Material Tela',
        'https://www.alteadesign.com/10484-large_default/sofa-russi-3-puestos-azul.jpg', '2020-01-25', 250, 599, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (4, 1, N'Sofá Shell Velvet Gris',
        'Color: Gris marengo Material: Terciopelo y Madera Medidas: 126 x 73 x 72 cm Peso: 18 Kg',
        'https://www.alteadesign.com/13066-large_default/sofa-shell-velvet-gris-126x725x72cm.jpg', '2020-01-25', 240,
        519, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (5, 1, N'Sofá Cama Lia Izquierdo Rojo', 'Medidas: 219x130x85 cm Material: Tela',
        'https://www.alteadesign.com/10701-large_default/sofa-cama-lia-rojo-izquierda.jpg', '2020-01-25', 520, 1199, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (6, 1, 'Mueble Tv 4Caj. Fresno', 'Medidas: 120x40x46cm Material: Madera',
        'https://www.alteadesign.com/10306-large_default/mueble-tv-4-caj-fresno.jpg', '2020-01-25', 190, 439, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (7, 1, 'Mesa TV Melamina', 'Material: MELAMINA WENGE/ HG BLANCO Medidas: 173X40X50CM',
        'https://www.alteadesign.com/11783-large_default/mesa-tv-melamina.jpg', '2020-01-25', 210, 489, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (8, 1, 'Mesa De Centro Harvard', 'Medidas: 119.5x59.5x Material: Estructura en Metal y Melamina contrachapada',
        'https://www.alteadesign.com/10058-large_default/mesa-de-centro-harvard-.jpg', '2020-01-25', 194, 458, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (9, 1, 'Mesa Cedro/Metal Negro', 'Medidas: 47x42x45cm Material: Metal y Cedro',
        'https://www.alteadesign.com/10308-large_default/mesa-axiliar-de-cedro.jpg', '2020-01-25', 64, 149, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (10, 1, 'Mesa Consola 2C Fresno 110X40X78', 'Medidas: 110x40x78cm Material: Madera',
        'https://www.alteadesign.com/10308-large_default/mesa-axiliar-de-cedro.jpg', '2020-01-25', 145, 329, 1);
-- Productos de Comedor

-- Productos de Dormitorio

-- Productos de Oficina

-- Productos de Exterior
