view: revenue_data {
  sql_table_name: revenue_forecast.revenue_data ;;

  measure: actual {
    type: sum
    sql: ${TABLE}.ACTUAL ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DATE ;;
  }

  dimension:  month{
    type: number
    sql:  CAST(FORMAT_TIMESTAMP('%m', CAST(${TABLE}.DATE  AS TIMESTAMP)) AS NUMERIC) ;;
  }
  measure: forecast {
    type: sum
    sql: ${TABLE}.FORECAST ;;
  }

  dimension: price_code {
    type: string
    sql: ${TABLE}.PRICE_CODE ;;
  }

  dimension: product_family {
    type: string
    sql: ${TABLE}.PRODUCT_FAMILY ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  dimension: upc_code {
    type: number
    sql: ${TABLE}.UPC_CODE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
