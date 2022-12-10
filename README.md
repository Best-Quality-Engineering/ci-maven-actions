# CI Maven GitHub Actions

A collection of GitHub Actions for composing
[CI Maven Workflows](https://github.com/Best-Quality-Engineering/ci-maven-workflows) based on
the [CI Maven Plugin](https://github.com/Best-Quality-Engineering/ci-maven-plugin).

| Action                                                     | Description                                                                                                                                                                                      |
|:-----------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`setup-runtime`](./setup-runtime/README.md)               | Prepares the Java runtime for executing Maven goals.                                                                                                                                             |
| [`install`](./install/README.md)                           | Executes the `install` goal using [CI friendly properties](https://maven.apache.org/maven-ci-friendly.html).                                                                                     |
| [`deploy-snapshot`](./deploy-snapshot/README.md)           | Executes the `deploy` goal using [CI friendly properties](https://maven.apache.org/maven-ci-friendly.html), with support for signing and deploying snapshot artifacts to an artifact repository. |
| [`export-revision`](export-revision/README.md)             | Exports the `revision` [CI friendly property](https://maven.apache.org/maven-ci-friendly.html) used by downstream release-related actions.                                                       |
| [`deploy-release`](./deploy-release/README.md)             | Executes the `deploy` goal using [CI friendly properties](https://maven.apache.org/maven-ci-friendly.html), with support for signing and deploying release artifacts to an artifact repository.  |
| [`git-user`](./git-user/README.md)                         | Establishes the git user responsible for automated activity.                                                                                                                                     |
| [`create-branch`](./create-branch/README.md)               | Creates a new branch.                                                                                                                                                                            |
| [`increment-pom`](./increment-pom/README.md)               | Executes the [`ci:increment-pom`](https://github.com/Best-Quality-Engineering/ci-maven-plugin#ciincrement-pom) goal.                                                                             |
| [`replace-content`](./replace-content/README.md)           | Executes the [`ci:replace-content`](https://github.com/Best-Quality-Engineering/ci-maven-plugin#cireplace-content) goal.                                                                         |
| [`merge-release-branch`](./merge-release-branch/README.md) | Changes created by these actions are committed to a release branch and merged into a base branch.                                                                                                |
