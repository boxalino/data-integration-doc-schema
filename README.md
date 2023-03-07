# Boxalino Data Integration Doc Schema

Boxalino Data Integration Document Schema collection, used for the upgraded Data Integration strategy.

1. [Read more about Data Integration with Boxalino](https://boxalino.atlassian.net/wiki/spaces/BPKB/pages/252149803/Data+Integration)

2. [Read more about the Data Structure](https://boxalino.atlassian.net/wiki/spaces/BPKB/pages/252280881/Data+Structure)

## Are you an integrator?
If you are preparing a data integration with Boxalino, the repository can be used for:

1. tracking structural updates.
  
2. testing your JSONL with the use of GCLOUD SDK: 

`bq load --source_format=NEWLINE_DELIMITED_JSON $TABLENAME $FILE $SCHEMA`

where, 
- *$TABLENAME* is the table in your BigQuery dataset,
- *$FILE* is the content to be loaded (JSONL)
- *$SCHEMA* is the schema JSON from the repository (ex: ./doc/doc_product.json)


3. testing your JSONL with the use of the *generator.html* 
   * a) copy locally the [*generator.html*](https://github.com/boxalino/data-integration-doc-schema/blob/master/schema/generator.html)
   * b) copy the JSON schema from the [*doc types*](https://github.com/boxalino/data-integration-doc-schema/tree/master/doc) 
   * c) paste the JSON schema in the [generator.html, for `var bqSchema=[];`](https://github.com/boxalino/data-integration-doc-schema/blob/master/schema/generator.html#L10)
   * d) open the generator.html in your browser
   * e) copy the displayed JSON object schema, generated for your data type
   * f) open any JSON validator of your choice (ex: https://www.jsonschemavalidator.net/, https://jsonschemalint.com/)
   * g) paste the JSON object schema and your JSONL data 
   * h) fix any errors 

> Note: the JSON validators are only able to validate the properties from your JSON sample that exist in the JSON schema definition. 
> Please make sure to not use undocumented properties in your JSON samples.

## Contact Us

If you have any question, just contact us at support@boxalino.com
