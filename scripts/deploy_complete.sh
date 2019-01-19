#!/bin/bash -
sam build --template ./template.yaml --build-dir ./build -u
sam package --template-file ./build/template.yaml --output-template-file ./build/packaged-template.yaml --s3-bucket trading-serverless
sam deploy --template-file ./build/packaged-template.yaml --stack-name trading-serverless