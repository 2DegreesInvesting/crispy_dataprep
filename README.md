### Format sql files

`pip install sqlfluff`

```
sqlfluff fix --dialect ansi ./models
```


### Setup the project's DB

1. Locate the profiles.yaml File
The profiles.yaml file is typically located in the .dbt directory in the user's home folder. If it doesn’t exist, the developer will need to create it. The location should be:

On Unix-based systems (Linux, MacOS): ~/.dbt/profiles.yaml
On Windows: %USERPROFILE%\.dbt\profiles.yaml

2. Create or Modify the profiles.yaml File :

```yaml
crispy_dataprep:
  target: dev
  outputs:
    dev:
      type: postgres
      threads: 1 
      host: hostname
      port: 5432
      user: username
      pass: password
      dbname: dbname
      schema: schema_name
```

3. Initialize the data sources : 

`dbt seed --full-refresh`

### DBT commands

```sh
dbt run
dbt test 
dbt docs generate && dbt docs serve
```


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices



### DBT CONCEPTS

In dbt (data build tool), different typologies of models represent various layers or stages in the transformation of raw data into consumable information, typically structured as part of a modern data warehouse architecture. Here are the common typologies of dbt models you may encounter, including some you've mentioned:

1. Sources
These models define the starting point of your data workflows. Source models are typically configurations that tell dbt how to treat raw data tables that are loaded directly from data ingestion tools. They often include specifications for data freshness and help in documenting the lineage of the data.

2. Staging Models
Staging models are used to clean and prepare raw data. This layer usually performs light transformations on source data, such as renaming fields, converting data types, or handling missing values. The aim is to create a clean, consistent base from which more complex transformations can be built.

3. Intermediate Models
Intermediate models act as the processing layer between staging and more finalized models. They are useful for complex transformations that might need to be reused or for breaking down transformations into manageable chunks. This layer can help in managing complex logic by keeping it organized and modular.

4. Marts (Data Marts)
Data marts are often the end product of the dbt workflow and are tailored for specific business domains (e.g., marketing, sales, finance). Models in this layer are usually highly transformed and aggregated to be directly used in reporting and analytics. They are often designed around specific business functions or requirements.

5. Dimensions and Facts
In some dbt projects, especially those designed around a star schema or a snowflake schema, models are categorized as dimensions and facts:

Dimension Models: These contain descriptive attributes related to business entities (like customers, products, locations) and are used to filter and label data in analytics.
Fact Models: These contain quantitative data (like sales transactions, event logs) and are typically built from multiple staging or intermediate models. They focus on metrics and measures used for analysis.
6. Core Models
Some dbt projects use a concept called "core models," which serve as a centralized layer of business logic that can be referenced by multiple data marts. These models ensure consistency in calculations and business rules across the project.

7. Operational Models
Operational models are typically used for operational reporting and day-to-day business operations. These models might not be as highly aggregated as data marts and often include more granular, transactional data.

8. Snapshot Models
dbt supports snapshot models for capturing the state of a record at a specific point in time. This is particularly useful for tracking changes to records over time (slowly changing dimensions) or for auditing purposes.