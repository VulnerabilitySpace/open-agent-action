echo "${{ inputs.DONGTAI_SERVER }}"
echo "${{ inputs.DONGTAI_TOKEN }}"
echo "${{ inputs.DONGTAI_DEBUG }}"
echo "${{ inputs.PROJECT_NAME }}"
echo "${{ inputs.PROJECT_CREATE }}"
echo "${{ inputs.PROJECT_VERSION }}"

# if debug, then skip this step
curl -X GET "${{ inputs.DONGTAI_SERVER }}/api/v1/agent/download?url=https://iast.io/openapi&language=java" -H "Authorization: Token ${{ inputs.DONGTAI_TOKEN }}" -o /tmp/agent.jar -k

export JAVA_TOOL_OPTIONS="-Dproject.create=${{ inputs.PROJECT_CREATE }} -Dproject.name=${{ inputs.PROJECT_NAME }} -Dproject.version=${{ inputs.PROJECT_VERSION }}"
