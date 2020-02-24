view: bq_logs {
  sql_table_name: `fiery-palace-234516.BQ_billing.cloudaudit_googleapis_com_data_access_20200224` ;;

  dimension: bq_query_id_raw {
#     hidden: yes
    type: string
    sql: protopayload_auditlog.resourceName ;;
  }

  dimension: bq_query_id {
    type: string
    sql: SUBSTR(${bq_query_id_raw}, 10) ;;
  }

  dimension: bq_query_id_regex{
    type: string
    sql:REGEXP_REPLACE(${bq_query_id_raw}, r"projects\/", "") ;;
  }

  dimension: looker_user_id {
    type: number
    sql: CAST(REGEXP_EXTRACT(${looker_query_id_raw}, r"user_id\":(\d{1,4})") AS INT64);;
  }

  dimension: looker_query_id {
    type: number
    sql: REGEXP_EXTRACT(${looker_query_id_raw}, r"history_id\":(\d{1,6})");;
  }

  dimension: looker_query_id_raw {
    type: string
    sql: protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobConfiguration.query.query ;;
  }

  dimension: billed_bytes {
    type: number
    sql: protopayload_auditlog.servicedata_v1_bigquery.jobCompletedEvent.job.jobStatistics.totalBilledBytes ;;
  }

  measure: total_billed_bytes {
    type: sum
    sql: ${billed_bytes} ;;
  }
}
