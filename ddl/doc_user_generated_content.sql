CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_user_generated_content_{{ F|D }}_{{ YYYYMMDD }}`  (
	  id STRING NOT NULL OPTIONS(description="the unique id of the ugc")
	, type STRING NOT NULL OPTIONS(description="the type of ugc: 'rating', 'question', 'answer', 'review', 'testimonial', 'comment', ...")
	, creation DATETIME OPTIONS(description="the creation date time of the ugc")
	, last_update DATETIME OPTIONS(description="the last update date time of the ugc")
	, persona_type STRING  OPTIONS(description="the persona type who created this ugc")
	, persona_id STRING  OPTIONS(description="the persona who created this ugc")
	, parent_ugc_ids ARRAY<STRING NOT NULL>  OPTIONS(description="the parent ugcs related to this ugc (e.g.: rating of themost helpful customer review / comments)")
	, products ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC>> OPTIONS(description="connections to products")
	, contents ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
	, customers ARRAY<STRUCT<type STRING, name STRING, persona_id STRING, customer_id STRING, value NUMERIC>> OPTIONS(description="relations to other customers")
	, value NUMERIC NOT NULL OPTIONS(description="the ucg value (weighting) (e.g.: 0.0 - 5.0 for stars)")
	, stores ARRAY<STRING> OPTIONS(description="the stores")
	, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the ugc")
	, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the product group")
	, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the ugc")
	, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the ugc")
	, link ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the link of the ugc")
	, tags ARRAY<STRUCT<type STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
	, labels ARRAY<STRUCT<type STRING NOT NULL, name STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the ugc, e.g.: [STRUCT('symbol', 'helpful', 'very', [STRUCT('de', 'sehr hilfreich')])]")
	, status BOOLEAN OPTIONS(description="the ucg status")
	, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the ugc")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the ugc")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the ugc")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the ugc")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the ugc")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the ugc")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the ugc")
    , creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
    , client_id     INT64 NOT NULL OPTIONS(description="technical field")
    , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
    )
OPTIONS(description="The user-generated-content (ugc) about products or other contents: e.g.: ratings, comments, questions, poll, ...");