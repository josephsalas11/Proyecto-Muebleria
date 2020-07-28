USE Workshop;

------------------------- CATEGORIAS -------------------------
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (1, 'Sala',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Salas, Sofás, Mesas de Centro, Muebles de Bar y Muebles de TV.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (2, 'Comedor',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Muebles de Comedor, Mesas de Comedor, Barstools, Sillas y Bancos, Bufeteras.',
        1);
INSERT INTO [dbo].Category(idCategory, name, description, enable)
VALUES (3, 'Dormitorio',
        N'FurniTEC Desing líder en amueblamiento para el hogar y oficina en Costa Rica, pone a su disposición la más exclusiva línea de Mueble de Dormitorios, Mesas de Noche, Gaveteros y Camas',
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
        'https://www.alteadesign.com/10304-large_default/mesa-consola-2c-fresno.jpg', '2020-01-25', 145, 329, 1);
-- Productos de Comedor
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (11, 2, 'Mesa Puro Plain 160X80cm',
        N'Muebles encantadores de la serie Puro, que impresiona con detalles amorosos y ornamentos artísticamente tallados a mano. El color brillante y natural le da un toque fresco y moderno.',
        'https://www.alteadesign.com/7035-large_default/mesa-puro-plain-160x80cm-.jpg', '2020-01-26', 420, 1179, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (12, 2, 'Mesa De Comedor Melodi', 'Material: Vidrio y Madera Medidas 180(50)x100x76cm',
        'https://www.alteadesign.com/10984-large_default/mesa-de-comedor-melodi.jpg', '2020-01-26', 730, 1699, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (13, 2, 'Silla Velvet Beige 48X59X81Cm.',
        N'Color: Beige y negro Material: Poliéster, espuma y acero Medidas: 48 x 59 x 81 cm Peso: 6 Kg',
        'https://www.alteadesign.com/13068-large_default/silla-velvet-beige-48x59x81cm.jpg', '2020-01-26', 75, 149, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (14, 2, 'Silla De Comedor Daniel',
        'Medida 43x50x98 cm Material: Polipiel Colores: Gris Claro, Gris Oscuro y Taupe Dark',
        'https://www.alteadesign.com/9663-large_default/silla-de-comedor-daniel.jpg', '2020-01-26', 64, 129, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (15, 2, N'Taburete Bar Rdo. Blanco Ø38,5X63Cm',
        N'Color: Blanco. Material: PU, nogal y acero. Medidas: Ø38,5x63cm.',
        'https://www.alteadesign.com/13061-large_default/taburete-bar-rdo-blanco-o385x63cm.jpg', '2020-01-26', 81, 149,
        1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (16, 2, 'Aparador Bajo X Factory 2 Puertas', 'Medidas del producto Ancho: 160 cm Largo: 40 cm Alto: 56 cm',
        'https://www.alteadesign.com/10881-large_default/aparador-bajo-x-factory-2-puertas.jpg', '2020-01-26', 399,
        1029, 1);
-- Productos de Dormitorio
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (17, 3, 'Cama Karen King Beige', 'Material: tela Medidas: 193x200cm',
        'https://www.alteadesign.com/13239-large_default/cama-karen-queen-gris.jpg', '2020-01-27', 422, 998, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (18, 3, 'Mesa De Noche', 'Materiales: MELAMINA DARK WALNUT  Medidas: 45X39X42CM',
        'https://www.alteadesign.com/11795-large_default/mesa-de-noche.jpg', '2020-01-27', 48, 119, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (19, 3, 'Tocador 1 C Fresno Espejo 70X40X124',
        'Color: Beige y dorado Material: Madera, acero y espejo Medidas: 70 x 40 x 124 cm Peso: 15 Kg',
        'https://www.alteadesign.com/13047-large_default/tocador-1-c-fresno-espejo-70x40x124.jpg', '2020-01-27', 140,
        349, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (20, 3, 'Cama Emely King', 'Medidas: 193x200cm Material: Melamina Color: Wengue',
        'https://www.alteadesign.com/10908-large_default/cama-emely-matrimonial.jpg', '2020-01-27', 326, 779, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (21, 3, 'Cama Melbourne Queen', 'Medidas: 152x202x117cm Material: Madera',
        'https://www.alteadesign.com/13309-large_default/cama-melbourne-queen.jpg', '2020-01-27', 505, 1059, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (22, 3, 'Aparador Melamina', 'Materiales: MELAMINA WENGE/ HG BLANCO Medidas: 165X40X78CM',
        'https://www.alteadesign.com/11804-large_default/aparador-melamina.jpg', '2020-01-27', 260, 579, 1);
-- Productos de Oficina
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (23, 4, 'Estanteria Cuadr Mad/Met70X15X71Cm', 'Material: Madera y metal Medidas: 70 x 15 x 71 cm Peso: 8 Kg',
        'https://www.alteadesign.com/13124-large_default/estanteria-cuadr-mad-met70x15x71cm.jpg', '2020-01-28', 68, 149,
        1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (24, 4, 'Escritorio Melamina Patas Negra', '180X70X76cm',
        'https://www.alteadesign.com/6227-large_default/escritorio-lorenzo.jpg', '2020-01-28', 320, 559, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (25, 4, 'Silla Onyx Gris', 'Silla ejecutiva asientotela , respaldo malla , brazos ajustable, base negra Nylon',
        'https://www.alteadesign.com/13210-large_default/silla-onyx-verde.jpg', '2020-01-28', 430, 699, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (26, 4, 'Brooklyn Nature Escritorio Laptop', '110x40cm',
        'https://www.alteadesign.com/11459-large_default/brooklyn-nature-escritorio-laptop-110x40cm.jpg', '2020-01-28',
        400, 919, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (27, 4, N'Estantería Authetico Zick Zack 180cm',
        N'Esta unidad de estante original muestra que descomponer las formas convencionales puede ser irresistible con sus esquinas y bordes, Zick Zack le da a su habitación un carácter individual',
        'https://www.alteadesign.com/6386-large_default/estanteria-authentico-zick-zack.jpg', '2020-01-28', 390, 795,
        1);
-- Productos de Exterior
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (28, 5, 'Mesa De Comedor Teak Exterior', 'Medidas: 220x92cm Material: Lisbon',
        'https://www.alteadesign.com/13363-large_default/mesa-teak-.jpg', '2020-01-29', 795, 1519, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (29, 5, 'Silla Lounge Dala', N'Medidas: 96x97x78cm Material: Aluminio y Ratán',
        'https://www.alteadesign.com/10569-large_default/silla-lounge-dala.jpg', '2020-01-29', 420, 859, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (30, 5, 'Silla Alu Exterior', N'Metarial: Aluminio Color: Carbón',
        'https://www.alteadesign.com/13358-large_default/silla-alu-exterior.jpg', '2020-01-29', 78, 129, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (31, 5, 'Estanteria De Plantas', 'Medidas: 60x40x140cm Material: Madera',
        'https://www.alteadesign.com/8713-large_default/estanteria-plantas-madera.jpg', '2020-01-29', 55, 139, 1);
INSERT INTO [dbo].Product(idProduct, idCategory, name, description, photo, manufacturingDate, productionCost, finalCost,
                          enable)
VALUES (32, 5, 'Silla Exterior Texas', 'Medidas: 60x59x75cm Material: Aluminio',
        'https://www.alteadesign.com/10398-large_default/silla-exterior-texas.jpg', '2020-01-29', 168, 379, 1);
