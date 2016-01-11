# SiS Selenium Features

This test suite tests the
[SiS Application](https://github.com/cbitstech/sis_app).

## Set up

To run this suite you will need to run the
[dashboard](https://github.com/cbitstech/sis_dashboard) locally. Just clone the
repo, change to the directory and run

```
rake db:drop db:create db:migrate
```

```
rails s
```

Then build and run the app in the browser locally based on the
[instructions](https://github.com/cbitstech/sis_app/blob/master/README.md).

## Run the suite

Once the dashboard and app are running locally, to run this test suite simply
run:

```
rpsec
```
