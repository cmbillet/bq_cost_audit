# Read Me

This pattern combines BigQuery (BQ) Logs, GCP Billing Data Export, & Looker System Acivity Data to create a view of spend per team. Implementing the Google Cloud Billing Block is also reccomended but not needed. There are a couple reasons this cannot be accomplished more easily:

1. Using different Google service accounts its easy to track spend by teams or account but then teams can't share looker content since they are tied to a model.
2. Using one Google service account always charges to the base project so even if different teams store data in different projects it cannot be broken apart in GCP.
3. GCP cost esimates are not avaliable in System Activity.
4. Oauth (to be completed sometime in Q2) will probably work but some companies won't want to give every user BQ access

To solve this, we can combine the sources above to gain an accurate picture of the billing and use Looker roles / groups to segment by team. This works best if the customer can export all three data sources into BQ or an external database.


1. Setup export of BQ logs to BQ.
2. Setup export of Looker usage via Google Cloud Storage Data Action
3. Setup export of GCP billing data to BQ (optional).
4. Model Data in Looker
5. Create Content in Looker
