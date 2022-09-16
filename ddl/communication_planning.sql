CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.communication_planning_{{ YYYYMMDD }}` (
	communication_id STRING NOT NULL OPTIONS(description="a unique generated communication UUID (PK)")
	, datetime TIMESTAMP OPTIONS(description="the timestamp at which the communication should be sent")
	, sending_sys_cd ARRAY<STRING>  OPTIONS(description="the systems code which sent the message (e.g.: 'NEWSLETTER', 'E-SHOP', ...)")
	, message_id STRING NOT NULL OPTIONS(description="a unique generated communication UUID (PK) which could be the same for different receipients")
	, thread_id STRING OPTIONS(description="the id of the communication thread (should refer to a prior communication_id or message_id which is the root of the thread)")
	, thread_type STRING OPTIONS(description="the type of the communication thread (typically 'message' of 'communication', by default is is considered as a 'communication' thread)")
	, thread_name STRING OPTIONS(description="the name of the communication thread")
	, thread_conditions ARRAY<STRUCT<
		condition_id STRING OPTIONS(description="")
		, type STRING OPTIONS(description="")
		, source STRING OPTIONS(description="")
		, name STRING OPTIONS(description="")
		, operator STRING OPTIONS(description="")
		, values ARRAY<STRING> OPTIONS(description="")
		, any_value BOOLEAN OPTIONS(description="")
		, filter ARRAY<STRUCT<
			condition_id STRING OPTIONS(description="")
			, type STRING OPTIONS(description="")
			, source STRING OPTIONS(description="")
			, name STRING OPTIONS(description="")
			, operator STRING OPTIONS(description="")
			, values ARRAY<STRING> OPTIONS(description="")
			, any_value BOOLEAN OPTIONS(description="")
			, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
			, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
			, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
			, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
			, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
			, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
		>>
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
	>> OPTIONS(description="the conditions for the thread to be true")
	, thread_condition_or BOOLEAN OPTIONS(description="are the conditions and or or to be true")
	, name STRING OPTIONS(description="the name of the campaign or communication")
	, channel_ids ARRAY<STRING> OPTIONS(description="the ids of the communication channels (optional)")
	, channel_names ARRAY<STRING> OPTIONS(description="the channels (name) of the communication: 'email', ...")
	, campaign_id STRING OPTIONS(description="the id of the campaign or communication group")
	, campaign_name STRING OPTIONS(description="the name of the campaign or communication group")
	, receivers ARRAY<STRUCT<
		type STRING NOT NULL OPTIONS(description="e.g.: billing, shipping")
		, persona_id STRING OPTIONS(description="the persona_id as referenced in other tables")
		, persona_type STRING OPTIONS(description="the type of persona (user, guest, ...)")
		, internal_id STRING OPTIONS(description="an additional internal id (optional)")
		, external_id STRING OPTIONS(description="the external identifier of the user (can be the same as the internal identifier)")
		, title STRING
		, prefix STRING
		, firstname STRING
		, middlename STRING
		, lastname STRING
		, suffix STRING
		, gender STRING
		, date_of_birth DATETIME
		, account_creation DATETIME
		, creation_label STRING
		, auto_group STRING
		, invoice_status STRING
		, status STRING
		, spouse_id STRING
		, children_ids ARRAY<STRING NOT NULL>
		, customer_groups ARRAY<STRING NOT NULL>
		, stores ARRAY<STRING> OPTIONS(description="the stores")
		, websites ARRAY<STRING> OPTIONS(description="the stores")
		, company STRING
		, vat STRING
		, vat_is_valid BOOLEAN
		, vat_request_id STRING
		, vat_request_date DATETIME
		, vat_request_success BOOLEAN
		, street STRING
		, additional_address_line STRING
		, city STRING
		, zipcode STRING
		, stateID STRING
		, department STRING
		, statename STRING
		, countryiso STRING
		, countryID STRING
		, phone STRING
		, email STRING
		, mobile_phone STRING
		, fax STRING
		, giftregistry_item_id STRING
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
		, subscriptions ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the subscriptions (e-mails and others)")
		, notifications ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the notofications (e-mails and others)")
		, voucher_states ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the vouchers (used and others)")
	>> OPTIONS(description="typically not use in case the receive is only 1 persona defined by its persona_id, but available for other cases")
	, receiver_visitor_ids ARRAY<STRING> OPTIONS(description="the visitor cookie ids from Boxalino of Google Analygtics (can be empty)")
	, senders ARRAY<STRUCT<
		type STRING NOT NULL OPTIONS(description="e.g.: billing, shipping")
		, persona_id STRING OPTIONS(description="the persona_id as referenced in other tables")
		, persona_type STRING OPTIONS(description="the type of persona (user, guest, ...)")
		, internal_id STRING OPTIONS(description="an additional internal id (optional)")
		, external_id STRING OPTIONS(description="the external identifier of the user (can be the same as the internal identifier)")
		, title STRING
		, prefix STRING
		, firstname STRING
		, middlename STRING
		, lastname STRING
		, suffix STRING
		, gender STRING
		, date_of_birth DATETIME
		, account_creation DATETIME
		, creation_label STRING
		, auto_group STRING
		, invoice_status STRING
		, status STRING
		, spouse_id STRING
		, children_ids ARRAY<STRING NOT NULL>
		, customer_groups ARRAY<STRING NOT NULL>
		, stores ARRAY<STRING> OPTIONS(description="the stores")
		, websites ARRAY<STRING> OPTIONS(description="the stores")
		, company STRING
		, vat STRING
		, vat_is_valid BOOLEAN
		, vat_request_id STRING
		, vat_request_date DATETIME
		, vat_request_success BOOLEAN
		, street STRING
		, additional_address_line STRING
		, city STRING
		, zipcode STRING
		, stateID STRING
		, department STRING
		, statename STRING
		, countryiso STRING
		, countryID STRING
		, phone STRING
		, email STRING
		, mobile_phone STRING
		, fax STRING
		, giftregistry_item_id STRING
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the voucher")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="additional localized string attributes of the voucher")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the voucher")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>> OPTIONS(description="additional localized numeric attributes of the voucher")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the voucher")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>> OPTIONS(description="additional localized datetime attributes of the voucher")
		, subscriptions ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the subscriptions (e-mails and others)")
		, notifications ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the notofications (e-mails and others)")
		, voucher_states ARRAY<STRUCT<type STRING, name STRING NOT NULL, status INT64 NOT NULL, periods ARRAY<STRUCT<start_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>, end_datetime ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="the state of the vouchers (used and others)")
	>> OPTIONS(description="information about the communication senders")
	, contents ARRAY<STRUCT<
		id STRING OPTIONS(description="the unique id of the content as provided in doc_content")
		, type STRING OPTIONS(description="the type of content as provided in doc_content: 'blog', 'magazin', 'page', ...")
		, language STRING OPTIONS(description="the language of the communication")
		, title STRING OPTIONS(description="the title of the content")
		, short_description STRING OPTIONS(description="the short description of the content")
		, description STRING OPTIONS(description="the description of the content")
		, parent_content_ids ARRAY<STRING NOT NULL>  OPTIONS(description="the parent contents related to this content (e.g.: rating of themost helpful customer review / comments)")
		, products ARRAY<STRUCT<type STRING, name STRING, product_line STRING, product_group STRING, sku STRING, value NUMERIC>> OPTIONS(description="connections to products")
		, contents ARRAY<STRUCT<type STRING, name STRING, content_type STRING, content_id STRING, value NUMERIC>> OPTIONS(description="relations to other contents")
		, topics ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the topics of the content")
		, brands ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the brands of the content")
		, suppliers ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the suppliers of the content")
		, categories ARRAY<STRUCT<categorization STRING NOT NULL, category_ids ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the categories of the content")
		, images ARRAY<STRUCT<name STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="the images of the content")
		, link ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>> OPTIONS(description="the link of the content")
		, tags ARRAY<STRUCT<type STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the tags of the product line, e.g.: [STRUCT('tag', 'hello world', [STRUCT('de', 'hello world')])]")
		, labels ARRAY<STRUCT<type STRING NOT NULL, name STRING NOT NULL, value STRING NOT NULL, loc_values ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>> OPTIONS(description="the labels of the content, e.g.: [STRUCT('symbol', 'helpful', 'very', [STRUCT('de', 'sehr hilfreich')])]")
		, widgets ARRAY<STRING>  OPTIONS(description="widgets of the api request")
		, filters       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="filters of the api request")
		, context_parameters       ARRAY<STRUCT<key STRING NOT NULL, values ARRAY<STRING>>> OPTIONS(description="parameters of the api request")
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the content")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the content")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the content")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the content")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the content")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the content")
	>>  OPTIONS(description="information about the content of the communication, typically only provided for the 'sent' event, as the other events should refer to the same message_id and persona_id / email so no need to indicate the content every time, only for sent")
	, requests ARRAY<STRUCT<
		 sessionId STRING OPTIONS(description="indicates if a specific sessionId must be provided, typically it is not indicated and you should set it with the value of the cems cookie if you have one")
		, profileId STRING OPTIONS(description="indicates if a specific profileId must be provided, typically it is not indicated and you should set it with the value of the cemv cookie if you have one")
		, customerId STRING OPTIONS(description="indicates if a specific customerId must be provided, typically it is not indicated and you should use the user account persona_id")
		, widget STRING OPTIONS(description="indicates the name of your configured widget")
		, language STRING OPTIONS(description="the language")
		, hitCount INT64 OPTIONS(description="the number of hit to be returned per page")
		, offset INT64 OPTIONS(description="the offset to be requested, by default 0")
		, groupBy STRING OPTIONS(description="the group by field, by default 'products_group_id'")
		, returnFields ARRAY<STRING NOT NULL> OPTIONS(description="The list of fields that should be returned for each bx-hit in the response")
		, filters ARRAY<STRUCT<field STRING, negative BOOLEAN, values ARRAY<STRING>, `from` FLOAT64, `to` FLOAT64, fromInclusive BOOLEAN, toInclusive BOOLEAN>> OPTIONS(description="The list of filters to apply in the request")
		, facets ARRAY<STRUCT<field STRING, values ARRAY<STRING>, valueKey STRING, numerical BOOLEAN, `range` BOOLEAN, boundsOnly BOOLEAN, `from` FLOAT64, `to` FLOAT64>> OPTIONS(description="The list of facets to apply in the request")
		, sort ARRAY<STRUCT<field STRING, reverse BOOLEAN>> OPTIONS(description="The list of sorts to apply in the request")
		, items ARRAY<STRUCT<field STRING, values ARRAY<STRING>, role STRING>> OPTIONS(description="The list of items to apply in the request")
		, orFilters BOOLEAN OPTIONS(description="if the filters should be applied as and or as or")
		, parameters ARRAY<STRUCT<name STRING, values ARRAY<STRING>>> OPTIONS(description="The list of fields that should be returned for each bx-hit in the response")
		, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the content")
		, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the content")
		, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the content")
		, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the content")
		, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the content")
		, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the content")
	>>  OPTIONS(description="information about the content of the communication, typically only provided for the 'sent' event, as the other events should refer to the same message_id and persona_id / email so no need to indicate the content every time, only for sent")
	, string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRING NOT NULL>>> OPTIONS(description="additional string (not localized) attributes of the content")
	, localized_string_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value STRING NOT NULL>>>>>> OPTIONS(description="additional localized string attributes of the content")
	, numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<NUMERIC NOT NULL>>> OPTIONS(description="additional numeric (not localized) attributes of the content")
	, localized_numeric_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, key STRING, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value NUMERIC NOT NULL>>>>>> OPTIONS(description="additional localized numeric attributes of the content")
	, datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<DATETIME NOT NULL>>> OPTIONS(description="additional datetime (not localized) attributes of the content")
	, localized_datetime_attributes ARRAY<STRUCT<type STRING, name STRING NOT NULL, values ARRAY<STRUCT<value_id STRING, value ARRAY<STRUCT<language STRING NOT NULL, value DATETIME NOT NULL>>>>>> OPTIONS(description="additional localized datetime attributes of the content")
) 
partition by date(datetime)
;