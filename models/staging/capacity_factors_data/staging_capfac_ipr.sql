SELECT
    variable_class,
    sub_variable_class_1,
    sub_variable_class_2,
    scenario,
    region,
    sector,
    units,
    year,
    value
FROM {{ ref('raw_capacity_factors_IPR2021') }}

UNION ALL

SELECT
    scenario,
    region,
    variable_class,
    sub_variable_class_1,
    sub_variable_class_2,
    sector,
    units,
    year,
    value
FROM {{ ref('raw_capacity_factors_IPR2023') }}
