view: users {
  sql_table_name: `fiery-palace-234516.looker_data.users` ;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    type: number
    sql: CAST(${TABLE}.User_ID AS INT64) ;;
  }

  dimension: groups {
    type: string
    sql: ${TABLE}.Group_Groups ;;
  }

  dimension: roles {
    type: string
    sql: ${TABLE}.Roles ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.User_Name ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, user_name]
  }
}
