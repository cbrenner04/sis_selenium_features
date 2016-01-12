# SiS Selenium Features

This test suite tests the
[SiS Application](https://github.com/cbitstech/sis_app).

## Set up

Due to dependency issues with versions of selenium-webdriver and Firefox, I
have different versions of Firefox running on my machine. The version used for
this suite is 33.0. I would suggest downloading this version of Firefox to the
same directory specified in the `spec_helper`. You can download version 33.0
[here](https://ftp.mozilla.org/pub/firefox/releases/33.0/mac/en-US/).

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
