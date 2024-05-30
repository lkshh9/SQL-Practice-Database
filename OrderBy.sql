SELECT
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    first_name;

SELECT
	first_name,
	last_name
FROM
	sales.customers
ORDER BY
	first_name DESC;

SELECT
    city,
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    city,
    first_name;

SELECT
    city,
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    city DESC,
    first_name ASC;

SELECT
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    LEN(first_name) DESC;


SELECT
    city,
    first_name,
    last_name
FROM
    sales.customers
ORDER BY
    state;