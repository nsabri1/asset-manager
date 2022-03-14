#!/usr/bin/env groovy

library("govuk")

node {
  // Run against the MongoDB 3.6 Docker instance on GOV.UK CI
  govuk.setEnvar("TEST_MONGODB_URI", "mongodb://127.0.0.1:27036/asset-manager-test")

  govuk.buildProject(
    beforeTest: {
      govuk.setEnvar('TEST_COVERAGE', 'true')
      govuk.setEnvar('JWT_AUTH_SECRET', 'secret')
    },
    publishingE2ETests: true,
    brakeman: true,
    afterTest: {
      govuk.setEnvar('AWS_S3_BUCKET_NAME', 'asset-precompilation-test')
    }
  )
}
