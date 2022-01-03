echo "Install DongTai For Project: $INPUTS_PROJECT_NAME"

echo "$INPUTS_DONGTAI_SERVER"
echo "$INPUTS_DONGTAI_TOKEN"
echo "$INPUTS_DONGTAI_DEBUG"
echo "$INPUTS_PROJECT_NAME"
echo "$INPUTS_PROJECT_CREATE"
echo "$INPUTS_PROJECT_VERSION"

# if debug, then skip this step
curl -X GET "$INPUTS_DONGTAI_SERVER/api/v1/agent/download?url=https://iast.io/openapi&language=java" -H "Authorization: Token $INPUTS_DONGTAI_TOKEN" -o /tmp/agent.jar -k

export JAVA_TOOL_OPTIONS="-Dproject.create=$INPUTS_PROJECT_CREATE -Dproject.name=$INPUTS_PROJECT_NAME -Dproject.version=$INPUTS_PROJECT_VERSION"

echo "Install Finished. Project ENV is: $JAVA_TOOL_OPTIONS"