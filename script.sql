-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas_db;
\c peliculas_db

CREATE TABLE peliculas( id INT PRIMARY KEY, titulo_pelicula VARCHAR(100), anio_estreno INT, director VARCHAR(50));

CREATE TABLE reparto(peliculas_fk INT, actor VARCHAR (100), FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id));

-- 2. Cargar ambos archivos a su tabla correspondiente.
\copy peliculas FROM 'C:\Users\CARLOS\Desktop\KATHY\JAVASCRIPT\M5\Desafio Top 100\peliculas.csv' csv header;
\copy reparto FROM 'C:\Users\CARLOS\Desktop\KATHY\JAVASCRIPT\M5\Desafio Top 100\reparto.csv' csv;

-- 3. Obtener el ID de la película “Titanic”.
SELECT id AS titanic_id FROM peliculas where titulo_pelicula='Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor AS reparto_titanic FROM reparto WHERE peliculas_fk=2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(peliculas_fk) AS cantidad_peliculas_harrison FROM reparto WHERE actor='Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT anio_estreno, titulo_pelicula FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY titulo_pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT titulo_pelicula, LENGTH(titulo_pelicula) AS longitud_titulo FROM peliculas ORDER BY LENGTH(titulo_pelicula) ASC;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(titulo_pelicula)) AS pelicula_maximo_caracter FROM peliculas;