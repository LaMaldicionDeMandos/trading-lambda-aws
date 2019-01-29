#!/bin/bash -
# Cuando se corre para un nuevo ENV hay que eliminar lo relacionado a la API key, para que pueda enerar bien el stage
sam build --parameter-overrides ParameterKey=InvertirOnlinePassword,ParameterValue=$INVERTIRONLINE_PASSWORD,ParameterKey=InvertirOnlineUsername,ParameterValue=$INVERTIRONLINE_USERNAME,ParameterKey=targetStage,ParameterValue=$ENV --template ./template.yaml --build-dir ./build -u
sam package --template-file ./build/template.yaml --output-template-file ./build/packaged-template.yaml --s3-bucket trading-serverless
sam deploy --parameter-overrides InvertirOnlinePassword=$INVERTIRONLINE_PASSWORD InvertirOnlineUsername=$INVERTIRONLINE_USERNAME targetStage=$ENV --template-file ./build/packaged-template.yaml --stack-name trading-serverless