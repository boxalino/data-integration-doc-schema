CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_order_{{ F|D }}_{{ YYYYMMDD }}`  (
	internal_id STRING NOT NULL OPTIONS(description="the internal identifier of the order")
  , external_id STRING OPTIONS(description="the external identifier of the order (can be the same as the internal identifier)")
  , parent_order_id STRING OPTIONS(description="the parent order id (when applicable)")
  , persona_type STRING  OPTIONS(description="the persona type who created this order")
  , persona_id STRING  OPTIONS(description="the persona who created this order")
  , order_sys_cd STRING  OPTIONS(description="the order system code (e.g.: 'ECM', 'ERP', ...)")
  , store STRING  OPTIONS(description="the store in which the order was done")
  , seller_persona_type STRING  OPTIONS(description="the persona type who sold this order")
  , seller_persona_id STRING  OPTIONS(description="the persona who sold this order")
  , currency_cd STRING  OPTIONS(description="the order currency code (e.g.: 'chf', 'eur', ...)")
  , total_crncy_amt NUMERIC  OPTIONS(description="the total value of the order")
  , total_crncy_amt_net NUMERIC  OPTIONS(description="the total value of the order")
  , total_gross_margin_crncy_amt NUMERIC  OPTIONS(description="the gross margin of the order")
  , total_net_margin_crncy_amt NUMERIC  OPTIONS(description="the net margin of the order")
  , shipping_costs_net NUMERIC  OPTIONS(description="the net shipping costs of the order")
  , shipping_costs NUMERIC  OPTIONS(description="the shipping costs of the order")
  , currency_factor NUMERIC  OPTIONS(description="the currency factor of the order")
  , tax_free BOOLEAN OPTIONS(description="was the order tax free?")
  , tax_rate NUMERIC  OPTIONS(description="the tax rate of the order")
  , tax_amnt NUMERIC  OPTIONS(description="the tax amount of the order")
  , payment_method STRING  OPTIONS(description="the payment method")
  , shipping_method STRING  OPTIONS(description="the shipping method")
  , shipping_description STRING  OPTIONS(description="the shipping description")
  , device STRING  OPTIONS(description="the device used")
  , referer STRING  OPTIONS(description="the referer used")
  , partner STRING  OPTIONS(description="the partner used")
  , language STRING  OPTIONS(description="the language of the order")
  , tracking_code STRING OPTIONS(description="the tracking code of the order")
  , is_gift BOOLEAN OPTIONS(description="was the order a gift?")
  , wrapping BOOLEAN OPTIONS(description="was the order with wrapping?")
  , email STRING  OPTIONS(description="the email of the order")
  , comments ARRAY<STRUCT<created DATETIME, persona_type STRING, persona_id STRING, comment STRING>>  OPTIONS(description="the comments")
  , internal_comments ARRAY<STRUCT<created DATETIME, persona_type STRING, persona_id STRING, comment STRING>>  OPTIONS(description="the internal comments")
  , customer_comments ARRAY<STRUCT<created DATETIME, persona_type STRING, persona_id STRING, comment STRING>>  OPTIONS(description="the customer comments")
  , contacts ARRAY<STRUCT<
		type STRING NOT NULL OPTIONS(description="e.g.: billing, shipping")
		,persona_id STRING OPTIONS(description="the persona_id as referenced in other tables")
		,persona_type STRING OPTIONS(description="the type of persona (user, guest, ...)")
		,internal_id STRING OPTIONS(description="an additional internal id (optional)")
		,external_id STRING OPTIONS(description="the external identifier of the user (can be the same as the internal identifier)")
		,title STRING
		,prefix STRING
		,firstname STRING
		,middlename STRING
		,lastname STRING
		,suffix STRING
		,gender STRING
		,date_of_birth DATETIME
		,account_creation DATETIME
		,creation_label STRING
		,auto_group STRING
		,invoice_status STRING
		,status STRING
		,spouse_id STRING
		,children_ids ARRAY<STRING NOT NULL>
		,customer_groups ARRAY<STRING NOT NULL>
		, stores ARRAY<STRING> OPTIONS(description="the stores")
		, websites ARRAY<STRING> OPTIONS(description="the stores")
		,company STRING
		,vat STRING
		,vat_is_valid BOOLEAN
		,vat_request_id STRING
		,vat_request_date DATETIME
		,vat_request_success BOOLEAN
		,street STRING
		,additional_address_line STRING
		,city STRING
		,zipcode STRING
		,stateID STRING
		,department STRING
		,statename STRING
		,countryiso STRING
		,countryID STRING
		,phone STRING
		,email STRING
		,mobile_phone STRING
		,fax STRING
		,giftregistry_item_id STRING
		,string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the voucher")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
		, subscriptions ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the subscriptions (e-mails and others)")
		, notifications ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the notofications (e-mails and others)")
		, voucher_states ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the vouchers (used and others)")
	>> OPTIONS(description="billing/shipping and other contact information")
	, creation DATETIME NOT NULL
	, last_update DATETIME
	, confirmation DATETIME
	, cleared DATETIME
	, sent DATETIME
	, received DATETIME
	, returned DATETIME
	, repaired DATETIME
	, status INT64 OPTIONS(description="the order status")
	, status_code STRING OPTIONS(description="the order status code")
	, internal_state STRING OPTIONS(description="the order internal state")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the order")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the order")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the order")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the order")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the order")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the order")
	, products ARRAY<STRUCT<
		sku_id STRING NOT NULL OPTIONS(description="the internal identifier of the sku")
		, connection_property STRING OPTIONS(description="the name of the connecting property for the sku_id value in case not the sku.internal_id")
		, type STRING OPTIONS(description="the type of product : sku, bundle, ...")
		, unit_list_price NUMERIC OPTIONS(description="unit price before any discount")
		, unit_sales_price NUMERIC OPTIONS(description="unit price displayed to the customer after discounts")
		, unit_gross_margin NUMERIC OPTIONS(description="unit the sales gross margin as an absolute value")
		, quantity NUMERIC OPTIONS(description="quantity of units of products")
		, total_list_price NUMERIC OPTIONS(description="unit price before any discount")
		, total_sales_price NUMERIC OPTIONS(description="unit price displayed to the customer after discounts")
		, total_gross_margin NUMERIC OPTIONS(description="unit the sales gross margin as an absolute value")
		, status BOOLEAN OPTIONS(description="the order product status")
		, status_code STRING OPTIONS(description="the order product status code")
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the sku")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the sku")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the sku")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the sku")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the sku")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the sku")
  >> OPTIONS(description="the products of the order") 
  
  , vouchers ARRAY<STRUCT<
	  internal_id STRING OPTIONS(description="the internal identifier of the voucher")
	, external_id STRING OPTIONS(description="the external identifier of the voucher (can be the same as the internal identifier)")
	, voucher_products ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, voucher STRING, value NUMERIC>> OPTIONS(description="products related to the voucher")
	, type STRING OPTIONS(description="the type value)")
	, ean STRING OPTIONS(description="the ean value)")
	, label STRING OPTIONS(description="label of the voucher")
	, voucher_percentage_value NUMERIC OPTIONS(description="the voucher percentage value")
	, voucher_absolute_value NUMERIC OPTIONS(description="the voucher absolute value")
	, status BOOLEAN OPTIONS(description="the voucher status")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the voucher")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
  >>
  
  , creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
  , client_id     INT64 NOT NULL OPTIONS(description="technical field")
  , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
  )
OPTIONS(description="Document-oriented store of orders (i.e.: purchases or transactions) data.");