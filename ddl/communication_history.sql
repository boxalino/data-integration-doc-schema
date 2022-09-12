CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.communication_history`
(
  id INT64 NOT NULL OPTIONS(description="a unique event id (PK)"),
  customer_id INT64 OPTIONS(description="the account id of the customer"),
  email STRING OPTIONS(description="the email address (can be null)"),
  cemv STRING OPTIONS(description="the visitor cookie id from Boxalino (can be null)"),
  run_id STRING OPTIONS(description="the id of the batch execution (can cover several communications)"),
  message_id STRING NOT NULL OPTIONS(description="the id of the communication (unique per communication, but can have several events, like sent, open, click, ..."),
  external_id STRING OPTIONS(description="an external id if provided by a separated system (for example, the request_id if provided by boxalino narrative response)"),
  name STRING OPTIONS(description="the name of the campaign or communication"),
  from_name STRING OPTIONS(description="the name of the person sending the communication"),
  from_email STRING OPTIONS(description="the email of the person sending the communication"),
  subject STRING OPTIONS(description="the subject line of the communication"),
  first_sentence STRING OPTIONS(description="the first line of the e-mail appearing before opening the e-mail"),
  type STRING NOT NULL OPTIONS(description="the kind of event, is one of the following values: 'reaction', ..."),
  channel STRING NOT NULL OPTIONS(description="the channel of the communication: 'email', ..."),
  event_type STRING NOT NULL OPTIONS(description="the type of event, is one of the following values: 'open', 'sent', 'click', ..."),
  datetime TIMESTAMP OPTIONS(description="the timestamp of the event"),
  content ARRAY<STRUCT<
    product_ids ARRAY<STRING>  OPTIONS(description="main products related to the content"),
    topic_ids ARRAY<STRING> OPTIONS(description="main topics related to the content"),
    category_ids ARRAY<STRING> OPTIONS(description="main categories related to the content"),
    brands ARRAY<STRING> OPTIONS(description="main brands related to the content"),
    widgets ARRAY<STRING>  OPTIONS(description="widgets of the api request"),
    filters       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="filters of the api request"),
    context_parameters       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="parameters of the api request"),
    additional_info       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="additional parameters about the content")
  >>  OPTIONS(description="information about the content of the communication"),
  additional_info       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="additional parameters about the communication"),
) 
partition by date(datetime)
cluster by customer_id, cemv
;