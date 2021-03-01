CREATE OR REPLACE TABLE `{{ YOUR_PROJECT }}.{{ YOUR_DATASET }}.doc_language_{{ F|D }}_{{ YYYYMMDD }}`  (
	  language STRING NOT NULL OPTIONS(description="the language code : 'de', 'fr', 'en', 'it', ...")
	, country_code STRING NOT NULL OPTIONS(description="optional, needed only to differentiate two diffrent ways to address the same language (e.g.: 'ch', 'de', ...), if used, the language used in other tables must be of the format '[country_code]-[language]', like 'ch-de' and 'de-de'")
	, creation_tm   DATETIME NOT NULL OPTIONS(description="technical field")
    , client_id     INT64 NOT NULL OPTIONS(description="technical field")
    , src_sys_id    INT64 NOT NULL OPTIONS(description="technical field")
    )
OPTIONS(description="The languages of the data (must match the ");