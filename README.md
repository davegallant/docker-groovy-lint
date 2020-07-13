# docker-groovy-lint

Lint and format groovy files (including Jenkinsfile) by using a containerized version of [npm-groovy-lint](https://github.com/nvuillam/npm-groovy-lint)

## usage

If you only want to format the Jenkinsfile:

```shell
docker build --tag groovy-lint .
alias groovy-lint='docker run -u "$(id -u):$(id -g)" -w=/tmp  -v "$PWD":/tmp groovy-lint'
groovy-lint --format --files '**/Jenkinsfile'
```
