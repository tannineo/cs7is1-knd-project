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

for Bar Or Pub, first `grep` :

- `-w` for a single word
- `-i` ignore the cases
- `\|` convert pipe to OR

```sh
cat Activities.csv | grep -i -w "bar\|pub" > Bars_Activities.csv
```

for Restaurant, rid of bars:

```sh
cat Activities.csv | grep -i -w "restaurant" | grep -i -w -v "bar\|pub" > Restaurant_Activities.csv
```

for Golf Club, rid of bars and restaurants:

```sh
cat Activities.csv | grep -i -w "golf" | grep -i -w -v "restaurant" | grep -i -w -v "bar\|pub" > Golf_Activities.csv
```

for the rest, make them as events

```sh
cat Activities.csv | grep -i -w -v "golf" | grep -i -w -v "restaurant" | grep -i -w -v "bar\|pub" > Other_Activities.csv
```

## Ontology Design

- try to reuse the existing ontologies(schemas) from [schema.org](https://schema.org/docs/developers.html)
  1. the `schema.ttl` is from here : http://schema.org/version/latest/schema.ttl
  2. copy-paste the used ontology from the `schema.ttl`

## Uplifting

After uplifting, do some replacement to adopt the turtle `prefix`

### Problems

hand written turtle files:

- the online validator: http://ttl.summerofcode.be/

data visualization problems:

- WebVOWL: http://www.visualdataweb.de/webvowl/

#### about merging the `LOCATION`

- the location for `PARK` and `PLAYGROUND` but not for `PITCH`
  - the meaning of the location is not the same
- SPARQL queries can be performed across the CSVs on different columns

so we are going to use a sub properties features.
