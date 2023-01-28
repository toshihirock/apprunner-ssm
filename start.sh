#!/bin/bash

amazon-ssm-agent -register -code ${CODE} -id ${ID} -region ${REGION}
nohup amazon-ssm-agent > /dev/null &
nginx -g "daemon off;"
