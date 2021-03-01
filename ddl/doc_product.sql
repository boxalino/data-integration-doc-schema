CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_product_{{ F|D }}_{{ YYYYMMDD }}`  (
	product_line STRUCT<
		  internal_id STRING OPTIONS(description="the internal identifier of the product line")
		, external_id STRING OPTIONS(description="the external identifier of the product line (can be the same as the internal identifier)")
		, label STRING OPTIONS(description="label of the product line")
		, creation DATETIME
		, last_update DATETIME
		, is_new BOOLEAN
		, in_sales BOOLEAN
		, product_relations ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC>> OPTIONS(description="relations to other products")
		, other_relations ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
		, stores ARRAY<STRING> OPTIONS(description="the stores")
		, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the product line")
		, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the product line")
		, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the product line")
		, brands ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the brands of the product line")
		, suppliers ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the suppliers of the product line")
		, categories ARRAY<STRUCT<categorization STRING, category_ids ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the categories of the product line")
		, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the product line")
		, link ARRAY<STRUCT<language STRING, value STRING NOT NULL>> OPTIONS(description="the link of the product line")
		, tags ARRAY<STRUCT<type STRING, value STRING, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
		, labels ARRAY<STRUCT<type STRING, name STRING NOT NULL, value STRING, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the product line, e.g.: [STRUCT('symbol', 'delivery', '24h', [STRUCT('de', '24-H Versand')])]")
		, pricing ARRAY<STRUCT<type STRING, values ARRAY<STRUCT<label STRING, language STRING, value STRING NOT NULL, currency STRING, region STRING>>>> OPTIONS(description="pricing information about the product line")
		, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the product line")
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the product line")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the product line")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the product line")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the product line")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the product line")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the product line")
		
		
		, product_groups ARRAY<STRUCT<
			  internal_id STRING OPTIONS(description="the internal identifier of the product group")
			, external_id STRING OPTIONS(description="the external identifier of the product group (can be the same as the internal identifier)")
			, label STRING OPTIONS(description="label of the product group")
			, creation DATETIME
			, last_update DATETIME
			, is_new BOOLEAN
			, in_sales BOOLEAN
			, product_relations ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC>> OPTIONS(description="relations to other products")
			, other_relations ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
			, stores ARRAY<STRING> OPTIONS(description="the stores")
			, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the product group")
			, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the product group")
			, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the product group")
			, brands ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the brands of the product group")
			, suppliers ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the suppliers of the product group")
			, categories ARRAY<STRUCT<categorization STRING, category_ids ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the categories of the product group")
			, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the product group")
			, link ARRAY<STRUCT<language STRING, value STRING NOT NULL>> OPTIONS(description="the link of the product group")
			, tags ARRAY<STRUCT<type STRING, value STRING, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
			, labels ARRAY<STRUCT<type STRING, name STRING NOT NULL, value STRING, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the product group, e.g.: [STRUCT('symbol', 'delivery', '24h', [STRUCT('de', '24-H Versand')])]")
			, pricing ARRAY<STRUCT<type STRING, values ARRAY<STRUCT<label STRING, language STRING, value STRING NOT NULL, currency STRING, region STRING>>>> OPTIONS(description="pricing information about the product group, what price is displayed on a product listing page?")
			, price ARRAY<STRUCT<
				  customer_groups ARRAY<STRING NOT NULL>
				, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>
				, list_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
				, sales_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price displayed to the customer after discounts")
				, gross_margin ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="the sales gross margin as an absolute value")
				, other_prices ARRAY<STRUCT<type STRING, language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="other sales price numbers")
				>> OPTIONS(description="default price information to be used for skus without price information")
			, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the product group")
			, visibility ARRAY<STRUCT<customer_groups ARRAY<STRING NOT NULL>, values ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>>>> OPTIONS(description="the product visibility :VISIBILITY_NOT_VISIBLE = 1; VISIBILITY_IN_CATALOG = 2; VISIBILITY_IN_SEARCH = 3; VISIBILITY_BOTH = 4;")
			, status ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>> OPTIONS(description="the product status")
			, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the product group")
			, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the product group")
			, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the product group")
			, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the product group")
			, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the product group")
			, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the product group")
			
			, skus ARRAY<STRUCT<
				  internal_id STRING NOT NULL OPTIONS(description="the internal identifier of the sku")
				, external_id STRING OPTIONS(description="the external identifier of the sku (can be the same as the internal identifier)")
				, type STRING OPTIONS(description="the type value)")
				, sku STRING OPTIONS(description="the sku value)")
				, ean STRING OPTIONS(description="the ean value)")
				, label STRING OPTIONS(description="label of the sku")
				, creation DATETIME
				, last_update DATETIME
				, is_new BOOLEAN
				, in_sales BOOLEAN
				, additional_product_groups ARRAY<STRUCT<type STRING, product_group STRING>> OPTIONS(description="connection to other product groups")
				, product_relations ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC>> OPTIONS(description="relations to other products")
				, other_relations ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
				, stores ARRAY<STRING> OPTIONS(description="the stores")
				, title ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the title of the sku")
				, short_description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the short description of the product group")
				, description ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the description of the sku")
				, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the sku")
				, brands ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the brands of the sku")
				, suppliers ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the suppliers of the sku")
				, categories ARRAY<STRUCT<categorization STRING, category_ids ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the categories of the sku")
				, link ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the link of the sku")
				, tags ARRAY<STRUCT<type STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
				, labels ARRAY<STRUCT<type STRING, name STRING NOT NULL, value STRING, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the sku, e.g.: [STRUCT('symbol', 'delivery', '24h', [STRUCT('de', '24-H Versand')])]")
				, price ARRAY<STRUCT<
					  customer_groups ARRAY<STRING NOT NULL>
					, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>
					, list_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price before any discount")
					, sales_price ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="price displayed to the customer after discounts")
					, gross_margin ARRAY<STRUCT<language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="the sales gross margin as an absolute value")
					, other_prices ARRAY<STRUCT<type STRING, language STRING, value STRING NOT NULL, currency STRING, region STRING>> OPTIONS(description="other sales price numbers")
					>>
				, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="information about the activity periods of the sku")
				, stock ARRAY<STRUCT<availability STRING, delivery_center STRING, value INT64>> OPTIONS(description="the current stock")
				, visibility ARRAY<STRUCT<customer_groups ARRAY<STRING NOT NULL>, values ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>>>> OPTIONS(description="the product visibility :VISIBILITY_NOT_VISIBLE = 1; VISIBILITY_IN_CATALOG = 2; VISIBILITY_IN_SEARCH = 3; VISIBILITY_BOTH = 4;")
				, status ARRAY<STRUCT<language STRING NOT NULL, value INT64 NOT NULL>> OPTIONS(description="the product status")
				, individually_visible BOOLEAN OPTIONS(description="in addition to be an sku in this product group, the product should also appear separately in the list of results as itself")
				, show_out_of_stock BOOLEAN OPTIONS(description="show the product even if it is out of stock")
				, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the sku")
				, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the sku")
				, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the sku")
				, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the sku")
				, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the sku")
				, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the sku")
				
				
			  > NOT NULL> OPTIONS(description="the product group with all its skus") 
			
			
		  > NOT NULL> OPTIONS(description="the product line with all its product groups and sku") 
		
		
	  > NOT NULL OPTIONS(description="the product line with all its product groups and skus") 
	  
    , creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
    , client_id     INT64 NOT NULL OPTIONS(description="technical field")
    , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
    )
OPTIONS(description="Document-oriented store of product data.");