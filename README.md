# SiS Selenium Features

This test suite tests the
[SiS Application](https://github.com/NU-CBITS/sis_app).

To run this suite you will need to run the
[dashboard](https://github.com/NU-CBITS/sis_dashboard) locally. Just clone the
repo, change to the directory and run

```
rake db:drop db:create db:migrate
```

```
rails s
```

Then build and run the app in the browser locally based on the
[instructions](https://github.com/NU-CBITS/sis_app/blob/master/README.md).

The app and dashboard can also be built and run from the test suite directory.

Before completing the steps below, add the below environment variable and set it to your working directory

```
ENV['Path']
```

First, in one bash tab run the following command to build and run the dashboard:

```
rake load_app_dash_local
```

Second, in another bash tab run the following command to build and run the app:

```
rake load_app_local
```


## Run the suite

Once the dashboard and app are running locally, to run this test suite simply
run:

```
rpsec
```

## Set Environment Variables


