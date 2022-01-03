echo "Install DongTai For Project: $PROJECT_NAME"

# if debug, then skip this step
if [ "$DONGTAI_DEBUG"=="false" ];then
    curl -X GET "$DONGTAI_SERVER/api/v1/agent/download?url=https://iast.io/openapi&language=java" -H "Authorization: Token $DONGTAI_TOKEN" -o /tmp/agent.jar -k
else
    echo "debug mode"
fi

echo JAVA_TOOL_OPTIONS="\"-javaagent:/tmp/agent.jar -Dproject.create=$PROJECT_CREATE -Dproject.name=$PROJECT_NAME -Dproject.version=$PROJECT_VERSION\"" >> ~/.bash_profile
echo "::set-output name=agent-env::$JAVA_TOOL_OPTIONS"
