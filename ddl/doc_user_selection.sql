CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_user_selection_{{ F|D }}_{{ YYYYMMDD }}`  (
	  id STRING NOT NULL OPTIONS(description="the unique id of the user selection")
	, type STRING NOT NULL OPTIONS(description="the type of user selection: 'basket', 'wishlist', 'compare', 'favorite', ...")
	, creation DATETIME OPTIONS(description="the creation date time of the user selection")
	, last_update DATETIME OPTIONS(description="the last update date time of the user selection")
	, persona_type STRING  OPTIONS(description="the persona type who created this user selection")
	, persona_id STRING  OPTIONS(description="the persona who created this user selection")
	, products ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC, creation DATETIME, last_update DATETIME>> OPTIONS(description="connections to products")
	, contents ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC, creation DATETIME, last_update DATETIME>> OPTIONS(description="relations to other contents")
	, customers ARRAY<STRUCT<type STRING, name STRING, persona_id STRING, customer_id STRING, value NUMERIC, creation DATETIME, last_update DATETIME>> OPTIONS(description="relations to other customers")
	, value NUMERIC NOT NULL OPTIONS(description="the ucg value (weighting) (e.g.: 0.0 - 5.0 for stars)")
	, stores ARRAY<STRING> OPTIONS(description="the stores")
	, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the user selection")
	, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the product group")
	, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the user selection")
	, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the user selection")
	, link ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the link of the user selection")
	, tags ARRAY<STRUCT<type STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
	, labels ARRAY<STRUCT<type STRING NOT NULL, name STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the user selection, e.g.: [STRUCT('symbol', 'helpful', 'very', [STRUCT('de', 'sehr hilfreich')])]")
	, status BOOLEAN OPTIONS(description="the ucg status")
	, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the user selection")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the user selection")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the user selection")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the user selection")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the user selection")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the user selection")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the user selection")
    , creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
    , client_id     INT64 NOT NULL OPTIONS(description="technical field")
    , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
    )
OPTIONS(description="The user-selction about products or other contents: e.g.: baket, wishlist, compare, favorite, ...");