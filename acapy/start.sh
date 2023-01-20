#!/bin/bash

set -euxo pipefail



echo "Starting agent with endpoint(s): ${MEDIATOR_URL} ws${WS_MEDIATOR_URL}"


#exec "/home/indy/.pyenv/libexec/pyenv" exec python3 -m cProfile /home/indy/.pyenv/versions/3.6.13/lib/python3.6/site-packages/aries_cloudagent/__main__.py start \
#exec "/home/indy/.pyenv/libexec/pyenv" exec python3 -m aries_cloudagent start \
exec "/home/indy/.pyenv/libexec/pyenv" exec ./prof.py start \
    --auto-provision \
    --arg-file ${MEDIATOR_ARG_FILE} \
    --label "${MEDIATOR_AGENT_LABEL}" \
    --inbound-transport http 0.0.0.0 ${MEDIATOR_AGENT_HTTP_IN_PORT} \
    --inbound-transport ws 0.0.0.0 ${MEDIATOR_AGENT_WS_IN_PORT} \
    --outbound-transport ws \
    --outbound-transport http \
    --wallet-type askar \
    --wallet-storage-type postgres_storage \
    --admin 0.0.0.0 ${MEDIATOR_AGENT_HTTP_ADMIN_PORT} \
    --admin-api-key ${MEDIATOR_AGENT_ADMIN_API_KEY} \
    --endpoint ${MEDIATOR_URL} ${WS_MEDIATOR_URL}
