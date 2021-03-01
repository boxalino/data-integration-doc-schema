# Boxalino Data Integration Doc Schema

Boxalino Data Integration Document Schema collection, used for the upgraded Data Integration strategy.

1. [Read more about Data Integration with Boxalino](https://boxalino.atlassian.net/wiki/spaces/BPKB/pages/252149803/Data+Integration)

2. [Read more about the Data Structure](https://boxalino.atlassian.net/wiki/spaces/BPKB/pages/252280881/Data+Structure)

## Are you an integrator?
If you are preparing a data integration with Boxalino, the repository can be used for:

* tracking structural updates.
  
* testing your JSONL with the use of GCLOUD SDK: 

`bq load --source_format=NEWLINE_DELIMITED_JSON $TABLENAME $FILE $SCHEMA`

where, 
- *$TABLENAME* is the table in your BigQuery dataset,
- *$FILE* is the content to be loaded (JSONL)
- *$SCHEMA* is the schema JSON from the repository (ex: ./doc/doc_product.json)

## Contact Us

If you have any question, just contact us at support@boxalino.com
