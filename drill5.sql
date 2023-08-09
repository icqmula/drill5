/*
    4. Construya las siguientes consultas:
		-Aquellas utilizadas para insertar,modificar,eliminar Customer, Staff y Actor
 */
 
 
 --Customer
 
 INSERT INTO public.customer(customer_id
							 , store_id
							 , first_name
							 , last_name
							 , email
							 , address_id
							 , activebool
							 , create_date
							 , last_update
							 , active)
	VALUES (700, 1, 'Ignacio', '¨Parada', 'nacho@gmail.com', 12, true, '20230730', null, 1);
		
	UPDATE CUSTOMER SET address_id = 15 WHERE CUSTOMER_ID = 700
	
	DELETE FROM CUSTOMER WHERE CUSTOMER_ID = 700
	
--Staff

INSERT INTO public.staff(staff_id
						 , first_name
						 , last_name
						 , address_id
						 , email
						 , store_id
						 , active
						 , username
						 , password
						 , last_update
						 , picture)
	VALUES (3, 'German', 'Zapata', 3, 'aaddsf@a.cl', 1, true, 'gzapata', 'aaa', '20230730', null);
	
	UPDATE STAFF SET EMAIL = 'zaoafnoidf@GMAIL.COM' WHERE staff_id = 3
	
	DELETE FROM staff WHERE staff_id = 3
	
	
--Actor

INSERT INTO public.actor(
	actor_id, first_name, last_name, last_update)
	VALUES (203, 'Marcelo', 'Perez', '20230731');

	UPDATE actor SET first_name = 'test' WHERE actor_id = 203
	
	DELETE FROM actor WHERE actor_id = 203	
	
	

/*
     Listar todas las rental con los datos del customer dado un mes y un año
 */



SELECT a.*
FROM rental a
JOIN customer b ON a.customer_id = b.customer_id
WHERE DATE_PART('MONTH', a.RENTAL_DATE) = 6
  AND DATE_PART('YEAR', a.RENTAL_DATE) = 2005
  AND a.CUSTOMER_ID = 7;


/*
     Listar Numero, Fecha(payment_date) y total (amount) de todas las payment
 */

SELECT payment_id, payment_date, SUM(amount) AS total_amount
FROM payment
GROUP BY payment_id, payment_date;


/*
 * Listar Todas las films del año 2006 que contenan un rental rate mayor 4.0
 */
 
SELECT *
FROM film
WHERE release_year = 2006 AND rental_rate > 4.0;



--5. Realiza un diccionario

SELECT

 isc.table_name,
 
 isc.column_name::character varying AS column_name,
 isc.column_default::character varying AS column_default,
 isc.data_type::character varying AS data_type,
 isc.character_maximum_length::integer AS str_length,

 isc.is_nullable
   FROM information_schema.columns isc
  WHERE isc.table_schema::text = 'public'::text
  ORDER BY isc.table_name, isc.ordinal_position;
