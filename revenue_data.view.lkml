view: revenue_data {
  sql_table_name: revenue_forecast.revenue_data ;;

  measure: actual {
    type: sum
    sql: ${TABLE}.ACTUAL ;;
    value_format_name: big_money
  }
  measure: forecast {
    type: sum
    sql: ${TABLE}.FORECAST ;;
    value_format_name: big_money
    drill_fields: [upc_code, sku, product_family, price_code, sale_date]
  }

  dimension_group: sale {
    type: time
    timeframes: [
      raw,
      date,
      hour,
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
    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }
  }

  dimension: upc_code {
    type: number
    sql: ${TABLE}.UPC_CODE ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
