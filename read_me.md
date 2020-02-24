# Read Me

This pattern combines BigQuery (BQ) Logs, GCP Billing Data Export, & Looker System Acivity Data to create a view of spend per team. There are a couple reasons this cannot be accomplished more easily:

1. Using different service accounts its easy to track but then teams can't share looker content since they are tied to a model.
2. Using one service account always charges to the base project so that doesn't help.
3. GCP cost esimates are not avaliable in System Activity.
4. Oauth (to be completed sometime in Q2) will probably work but some companies won't want to give every user BQ access

To solve this, we can combine the sources above to gain an accurate picture of the billing and use Looker roles / groups to segment by team. This works best if the customer can export all three data sources into BQ or an external database. In this example merged results is used to demo the end result. This would not scale since it will require joining on a query_id. If the customer is Looker hosted having them join the BQ system activity beta would potenitally be helpful.

1. Setup export of GCP billing data to BQ.
2. Setup export of BQ logs to BQ.
3. Setup export of Looker usage to external analytics DB (if not done already).
