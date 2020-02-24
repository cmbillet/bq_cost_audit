connection: "billet"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: bq_logs {
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bq_logs.looker_user_id} = ${users.user_id} ;;
  }
}


explore: users {
  join: bq_logs {
    type: left_outer
    relationship: one_to_many
    sql_on: ${bq_logs.looker_user_id} = ${users.user_id} ;;
  }
}
