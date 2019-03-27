connection: "revenue_forecast"

# include all the views
include: "*.view"

datagroup: revenue_forecast_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: revenue_forecast_default_datagroup

explore: revenue_data {}
