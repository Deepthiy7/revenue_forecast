connection: "revenue_forecast"

# include all the views
include: "*.view"

datagroup: revenue_forecast_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: big_money {
  value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00"
}

persist_with: revenue_forecast_default_datagroup

explore: revenue_data {}
