SELECT
    scenario,
    region,
    sector,
    units,
    variable_class,
    sub_variable_class_1,
    sub_variable_class_2,
    year,
    value
FROM {{ ref('ipr_Scenarios_AnalysisInput') }}

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
FROM {{ ref('ipr2023_Scenarios_AnalysisInput') }}
