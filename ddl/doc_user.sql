CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_user_{{ F|D }}_{{ YYYYMMDD }}`  (
	persona_id STRING NOT NULL OPTIONS(description="the persona_id as referenced in other tables")
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
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
	, subscriptions ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the subscriptions (e-mails and others)")
	, notifications ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the notofications (e-mails and others)")
	, voucher_states ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the vouchers (used and others)")
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
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
		, subscriptions ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the subscriptions (e-mails and others)")
		, notifications ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the notofications (e-mails and others)")
		, voucher_states ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the vouchers (used and others)")
	>> OPTIONS(description="billing/shipping and other contact information")
  , creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
  , client_id     INT64 NOT NULL OPTIONS(description="technical field")
  , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
  )
OPTIONS(description="Document-oriented store of users (customers) data.");