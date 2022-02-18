# open-agent Action
This action runs HXSecurity industry-leading application security analysis engine, DongTai-IAST, discover security vulnerabilities with automated testing of code in repositories. It then automatically uploads the results to GitHub so they can be displayed in the repository's security tab. DongTai-IAST developed by the community and the [HXSecurity DongTai Lab](https://dongtai.io/) to find common vulnerabilities in your code.


## License

This project is released under the [Apache 2.0 License](LICENSE).

The underlying DongTai Agent, used in this action, is licensed under the [GitHub HXSecurity Terms and Conditions](https://github.com/HXSecurity/DongTai-agent-java/blob/main/LICENSE). As such, this action may be used on open source projects hosted on GitHub, and on  private repositories that are owned by an organisation with GitHub Advanced Security enabled.

## USage

To get code scanning results from DongTai-IAST on your repo you can use the following workflow as a template:

```yml
name: "Vulnerability Scan"

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  schedule:
    #        ┌───────────── minute (0 - 59)
    #        │  ┌───────────── hour (0 - 23)
    #        │  │ ┌───────────── day of the month (1 - 31)
    #        │  │ │ ┌───────────── month (1 - 12 or JAN-DEC)
    #        │  │ │ │ ┌───────────── day of the week (0 - 6 or SUN-SAT)
    #        │  │ │ │ │
    #        │  │ │ │ │
    #        │  │ │ │ │
    #        *  * * * *
    - cron: '30 1 * * 0'

jobs:
  Build-Application:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write

    steps:
      - uses: actions/checkout@v2
      - name: Set up JDK 1.8
        uses: actions/setup-java@v1
        with:
          distribution: zulu
          java-version: 1.8
          architecture: x64
      - name: Set up Maven
        uses: stCarolas/setup-maven@v4
        with:
          maven-version: 3.2.5

      - name: Build with Maven
        run: |
          mvn -B package -Dmaven.test.skip=true
          ls -l
      
      - name: Set up DongTai
        id: dongtai
        uses: exexute/open-agent-action@main
        with:
          project-name: "SpringVulExample"
      
      - name: Set up zulu JDK 1.8 x86
        uses: actions/setup-java@v1
        with:
          distribution: zulu
          java-version: 1.8
          architecture: x86
      
      - name: Run Automated Testing
        run: |
          java -version
          bash ${{ github.workspace }}/.github/scripts/run-example.sh
  
```
