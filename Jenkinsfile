#!/usr/bin/env groovy

library("govuk")

node ('mongodb-2.4') {
  govuk.buildProject(
    beforeTest: {
      govuk.setEnvar('TEST_COVERAGE', 'true')
    },
    sassLint: false,
    publishingE2ETests: true,
    brakeman: true,
    afterTest: {
      govuk.setEnvar('AWS_S3_BUCKET_NAME', 'asset-precompilation-test')
    }
  )
}
