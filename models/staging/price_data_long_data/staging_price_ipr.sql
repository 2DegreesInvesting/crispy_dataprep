SELECT
    scenario,
    region,
    variable_class,
    sub_variable_class_1,
    NULL as sub_variable_class_2,  -- Placeholder for the extra column
    NULL as sector,                -- Placeholder for the extra column    
    units,
    year,
    value
FROM {{ ref('raw_price_data_long_IPR2021') }}

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
FROM {{ ref('raw_price_data_long_IPR2023') }}
