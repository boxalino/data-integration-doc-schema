CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_voucher_{{ F|D }}_{{ YYYYMMDD }}`  (
	  internal_id STRING NOT NULL OPTIONS(description="the internal identifier of the voucher")
	, external_id STRING OPTIONS(description="the external identifier of the voucher (can be the same as the internal identifier)")
	, voucher_products ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, voucher STRING, value NUMERIC>> OPTIONS(description="products related to the voucher")
	, voucher_products_attributes ARRAY<STRUCT<operator STRING, segments ARRAY<STRUCT<type STRING, name STRING, value STRING>>>> OPTIONS(description="product segments related to the voucher")
	, type STRING OPTIONS(description="the type value)")
	, ean STRING OPTIONS(description="the ean value)")
	, label STRING OPTIONS(description="label of the voucher")
	, creation DATETIME
	, last_update DATETIME
	, is_new BOOLEAN
	, in_sales BOOLEAN
	, product_relations ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, voucher STRING, value NUMERIC>> OPTIONS(description="relations to other products")
	, other_relations ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
	, stores ARRAY<STRING> OPTIONS(description="the stores")
	, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the voucher")
	, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the voucher")
	, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the voucher")
	, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the voucher")
	, brands ARRAY<STRUCT<name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the brands of the voucher")
	, suppliers ARRAY<STRUCT<name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the suppliers of the voucher")
	, categories ARRAY<STRUCT<categorization STRING NOT NULL, category_ids ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the categories of the voucher")
	, link ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the link of the voucher")
	, tags ARRAY<STRUCT<type STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
	, labels ARRAY<STRUCT<type STRING NOT NULL, name STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the voucher, e.g.: [STRUCT('symbol', 'delivery', '24h', [STRUCT('de', '24-H Versand')])]")
	, price ARRAY<STRUCT<
		  customer_groups ARRAY<STRING NOT NULL>
		, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>
		, list_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
		, sales_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price displayed to the customer after discounts")
		, gross_margin ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="the sales gross margin as an absolute value")
		, other_prices ARRAY<STRUCT<type STRING, language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="other sales price numbers")
		, bundle_percentage_value ARRAY<STRUCT<language STRING, value NUMERIC NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
		, bundle_absolute_value ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
		, voucher_percentage_value ARRAY<STRUCT<language STRING, value NUMERIC NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
		, voucher_absolute_value ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
		>> OPTIONS(description="default price information to be used for skus without price information")
	, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the voucher")
	, stock ARRAY<STRUCT<availability STRING, delivery_center STRING, value INT64>> OPTIONS(description="the current stock")
	, visibility ARRAY<STRUCT<customer_groups ARRAY<STRING NOT NULL>, values ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>>>> OPTIONS(description="the product visibility :VISIBILITY_NOT_VISIBLE = 1; VISIBILITY_IN_CATALOG = 2; VISIBILITY_IN_SEARCH = 3; VISIBILITY_BOTH = 4;")
	, status ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>> OPTIONS(description="the product status")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the voucher")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
	, creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
  , client_id     INT64 NOT NULL OPTIONS(description="technical field")
  , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
  )
OPTIONS(description="The languages of the data (must match the ");