FROM lambci/lambda:build

ENV AWS_LAMBDA_FUNCTION_NAME=osgb-openname-import \
    AWS_LAMBDA_FUNCTION_VERSION=2 \
    AWS_LAMBDA_FUNCTION_MEMORY_SIZE=384 \
    AWS_LAMBDA_FUNCTION_TIMEOUT=60 \
    AWS_REGION=us-east-1

#ADD . .

# If we want to match permissions in /var/task exactly...
USER root

RUN npm rebuild &&\
    npm install -g \
        bluebird \
        pg-promise &&\
    chown -R slicer:497 .

USER sbx_user1051
