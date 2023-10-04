{% test primary_key(model, column_name) %}

WITH validation AS (
	SELECT
	{{ column_name }} as primary_key,
	Count(1) as occurrences
	FROM{{ model }}
	GROUP BY 1
)

SELECT *
FROM validation
WHERE primary_key IS NULL
	OR occurrences > 1

{% endtest %}