/*CONSULTA 1
Mostrar histórico de paquetes vendidos por cada agente de viaje mostrando año de venta,
nombre del agente, tipo de paquete vendido y la cantidad de este.
*/
SELECT 
EXTRACT(YEAR FROM CONTRATO_IDA) AS AÑO,
ASESOR_NOMBRE AS NOMBRE_ASESOR,
PT.PAQUETE_NOMBRE AS TIPO_PAQUETE,
COUNT(PT.PAQUETE_NOMBRE) AS TOTAL_VENTAS


FROM CONTRATO C
INNER JOIN ASESOR_DE_VIAJE AV ON C.ASESOR_ID= AV.ASESOR_ID
INNER JOIN PAQUETES_TURISTICOS PT ON C.PAQUETE_ID= PT.PAQUETE_ID
GROUP BY PT.PAQUETE_NOMBRE, ASESOR_NOMBRE,EXTRACT(YEAR FROM CONTRATO_IDA)
ORDER BY (ASESOR_NOMBRE) DESC;


/* CONSULTA 2 
Mostrar histórico de Estancia en los paquetes vendidos por año, Estancia,
 numero de paquetes vendidos de mayor a menor
*/
SELECT 
EXTRACT(YEAR FROM CONTRATO_IDA) AS AÑO,
PT.RESTAURANTE_ID AS LOCAL,
PT.ESTANCIA_ID AS LOCAL,
PT.EVENTO_ID AS LOCAL,

COUNT(PT.PAQUETE_NOMBRE) AS TOTAL_VENTAS

FROM CONTRATO C
INNER JOIN PAQUETES_TURISTICOS PT ON C.PAQUETE_ID= PT.PAQUETE_ID
GROUP BY PT.PAQUETE_NOMBRE,EXTRACT(YEAR FROM CONTRATO_IDA),PT.RESTAURANTE_ID,PT.ESTANCIA_ID,PT.EVENTO_ID
ORDER BY EXTRACT(YEAR FROM CONTRATO_IDA) DESC;

/*CONSULTA 3
Mostrar detalle de compras por cliente mostrando año, nombre del cliente, número de paquetes comprados, total pagado
*/
SELECT 
EXTRACT(YEAR FROM CONTRATO_IDA) AS AÑO,
CV.CLIENTE_NOMBRE AS NOMBRE_CLIENTE,
COUNT(CONTRATO_ID) AS TOTAL_PAQUETES_COMPRADOS,
SUM(CONTRATO_PAGO) AS PAGO_ANUAL

FROM CONTRATO C
INNER JOIN CLIENTE_VIAJERO CV ON C.CLIENTE_ID= CV.CLIENTE_ID
INNER JOIN PAQUETES_TURISTICOS PT ON C.PAQUETE_ID= PT.PAQUETE_ID
GROUP BY CV.CLIENTE_NOMBRE,EXTRACT(YEAR FROM CONTRATO_IDA)
ORDER BY EXTRACT(YEAR FROM CONTRATO_IDA) DESC;

/* CONSULTA 4 
Histórico de calidad de satisfacción por Estancia mostrando año, lugares, número de visitas, Calidad buena o mala
*/
SELECT AÑO,LUGAR, COUNT(LUGAR) total 
		FROM (
			SELECT 
			AV.RESTAURANTE_ID as LUGAR,			
			EXTRACT(YEAR FROM C.CONTRATO_IDA) AS AÑO 
				FROM ACTO_VANDALICO AV INNER JOIN CONTRATO C ON AV.CONTRATO_ID=C.CONTRATO_ID
				UNION ALL
			SELECT ESTANCIA_ID as LUGAR, EXTRACT(YEAR FROM C.CONTRATO_IDA) AS AÑO 
				FROM ACTO_VANDALICO AV INNER JOIN CONTRATO C ON AV.CONTRATO_ID=C.CONTRATO_ID
				UNION ALL
			SELECT EVENTO_ID as LUGAR, EXTRACT(YEAR FROM C.CONTRATO_IDA) AS AÑO 
				FROM ACTO_VANDALICO AV INNER JOIN CONTRATO C ON AV.CONTRATO_ID=C.CONTRATO_ID
		) tbl_tmp
	WHERE LUGAR IS NOT NULL
	GROUP BY LUGAR,AÑO
	ORDER BY AÑO DESC; 





