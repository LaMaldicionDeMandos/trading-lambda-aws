#!/bin/bash -
sam build --parameter-overrides ParameterKey=InvertirOnlinePassword,ParameterValue=$INVERTIRONLINE_PASSWORD,ParameterKey=InvertirOnlineUsername,ParameterValue=$INVERTIRONLINE_USERNAME --template ./template.yaml --build-dir ./build -u
sam package --template-file ./build/template.yaml --output-template-file ./build/packaged-template.yaml --s3-bucket trading-serverless
sam deploy --parameter-overrides InvertirOnlinePassword=$INVERTIRONLINE_PASSWORD InvertirOnlineUsername=$INVERTIRONLINE_USERNAME --template-file ./build/packaged-template.yaml --stack-name trading-serverless