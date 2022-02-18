echo "Install DongTai For Project: $PROJECT_NAME"

# if debug, then skip this step
if [ "$DONGTAI_DEBUG"=="false" ];then
    curl -X GET "$DONGTAI_SERVER/api/v1/agent/download?url=https://iast.io/openapi&language=java" -H "Authorization: Token $DONGTAI_TOKEN" -o /tmp/agent.jar -k
else
    echo "debug mode"
fil

export JAVA_TOOL_OPTIONS="-javaagent:/tmp/agent.jar -Ddongtai.app.create=$PROJECT_CREATE -Ddongtai.app.name=$PROJECT_NAME -Ddongtai.app.version=$PROJECT_VERSION -Ddongtai.debug=$DONGTAI_DEBUG"

echo "::set-output name=agent-env::$JAVA_TOOL_OPTIONS"
