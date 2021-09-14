create table Vendedores(
codigo varchar(100) primary key,
nombre varchar(100));

insert into Vendedores values('VWEM01', 'DE ALBA VILLALOBOS LILIANA LIZBETH');
insert into Vendedores values('VWEM02', 'FACIO ESPINOSA JUAN CARLOS');
insert into Vendedores values('VWEM03', 'GOMEZ CANO JOSE MIGUEL');
insert into Vendedores values('VWEM04', 'GOMEZ CASTAÑEDA MARIA FERNANDA');
insert into Vendedores values('VWEM05', 'GOMEZ LOPEZ RAFAEL');

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_BorrarVendedor`(
IN p_CodigoVendedor VARCHAR(50),
IN p_NombreVendedor VARCHAR(50)
)
BEGIN
	DECLARE existe INT DEFAULT 0;
	SELECT COUNT(*) FROM Vendedores WHERE codigo = p_CodigoVendedor INTO existe;
	IF existe > 0 THEN
		DELETE FROM Vendedores WHERE (codigo = p_CodigoVendedor);
	else
		SELECT "NO EXISTE DICHO DATO";
    END IF;

END
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_AgregarVendedor`(
IN p_CodigoVendedor VARCHAR(50),
IN p_NombreVendedor VARCHAR(50)
)
BEGIN
	DECLARE existe INT DEFAULT 0;
	SELECT COUNT(*) FROM Vendedores WHERE codigo = p_CodigoVendedor INTO existe;
	if	existe = 0 THEN
		insert INTO Vendedores VALUES(p_CodigoVendedor,p_NombreVendedor);
		SELECT "AGREGADO";
	ELSE
        SELECT "YA EXISTE";
	END IF;
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_ModificarVendedor`(
IN p_CodigoVendedor VARCHAR(50),
IN p_NombreVendedor VARCHAR(50)
)
BEGIN
	DECLARE existe INT DEFAULT 0;
	SELECT COUNT(*) FROM vendedor WHERE codigoVendedor = p_CodigoVendedor INTO existe;
	IF existe > 1 THEN
		UPDATE vendedor SET codigovendedor = p_CodigoVendedor, nombrevendedor = p_NombreVendedor WHERE (codigovendedor = p_CodigoVendedor);
	else
		SELECT "NO EXISTE DICHO DATO";
    END IF;

END
