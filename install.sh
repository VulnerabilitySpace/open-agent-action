echo "Install DongTai For Project: $PROJECT_NAME"

echo "$DONGTAI_SERVER"
echo "$DONGTAI_TOKEN"
echo "$DONGTAI_DEBUG"
echo "$PROJECT_NAME"
echo "$PROJECT_CREATE"
echo "$PROJECT_VERSION"

# if debug, then skip this step
curl -X GET "$DONGTAI_SERVER/api/v1/agent/download?url=https://iast.io/openapi&language=java" -H "Authorization: Token $DONGTAI_TOKEN" -o /tmp/agent.jar -k

export JAVA_TOOL_OPTIONS="-Dproject.create=$PROJECT_CREATE -Dproject.name=$PROJECT_NAME -Dproject.version=$PROJECT_VERSION"

echo "Install Finished. Project ENV is: $JAVA_TOOL_OPTIONS"
echo "::set-output name=JAVA_TOOL_OPTIONS::$JAVA_TOOL_OPTIONS"