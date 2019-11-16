# CS7IS1 Knowledge and Data Engineering Project

focus on weekend activities in Galway.

## TODO

- [x] [Protege](https://protege.stanford.edu/) -> design the ontology
- [ ] [Juma](http://juma.adaptcentre.ie/juma-editor/) / [R2RML](https://www.w3.org/TR/r2rml/) -> uplift
- [ ] [Jena](https://jena.apache.org/index.html) -> import data, host a backend
- [ ] SPARQL / [yasgui](https://yasgui.org/) -> writing queries
- [ ] UI (frontend? webpage?)

## Data

the data can be found at [data.gov.ie](https://data.gov.ie)

- [Activities.csv](./csv/Activities.csv)
  - https://data.gov.ie/dataset/activities

### Data Preprocessing

- each row from CSV is suggested to have a `ID` when uplifting using Juma
  - add a column `ID` in [Activities.csv](./csv/Activities.csv)
  - changing `OBJECTID` into `ID` of other CSVs
- the head of tables are suggested to be in all capital letters eg. `NAME`
  - because all the operations on columns/heads accept only capital letters

## Ontology Design

- try to reuse the existing ontologies(schemas):

### Problems

#### about merging the `LOCATION`

- the location for `PARK` and `PLAYGROUND` but not for `PITCH`
  - the meaning of the location is not the same
- SPARQL queries can be performed across the CSVs on different columns

so we are going to use a sub properties features.
