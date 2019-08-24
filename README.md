# Backend Testing
**In progress**

## Table of Contents
- [Backend Testing](#backend-testing)
    - [Table of Contents](#table-of-contents)
    - [About backend testing](#about-backend-testing)
        - [Technology Stack](#technology-stack)
            - [RobotFramework](#robotframework)
        - [Folder Structure](#folder-structure)
    - [Using Backend Testing](#using-backend-testing)
        - [Run script](#run-script)
    - [Working with Backend Testing](#working-with-backend-testing)
        - [Prerequisites](#prerequisites)
        - [Styles and Conventions](#styles-and-conventions)
        - [Keywords](#keywords)
    - [Contributing to backend testing](#contributing-to-backend-testing)
        - [Creating Pull Requests](#creating-pull-requests)
        - [Merging Pull Requests](#merging-pull-requests)
    - [Jenkins pipeline](#jenkins-pipeline)


## About backend testing

**In progress** The goals of testing this are:

### Technology Stack
**In progress** This section covers the technology stack and approach used in backend testing.

#### RobotFramework
**In progress** Robot framework is a testing tool...

### Folder Structure
The backend testing repository has the following folder structure:

```
├── keywords   
    ├──api
├── resources
  ├──testdata
├── results
├── schemas 
├── testcases
  ├── {endpointname}
```

Where:
* `JMeter`: **In progress**.
* `keywords`: **In progress**.
* `resources`: **In progress** .
* `results`: **In progress** .
* `schemas`: **In progress** .
* `testcases`: **In progress**.

**[▲ Back to Top](#table-of-contents)**

## Using Backend Testing

**In progress** The goal of backend testing is ...  
The following instructions enable you to install and use a backend testing in your application. 

To use  Backend Testing:

1. Install Python dependencies:
    ```
        pip install -r requirements.txt
    ```

2. Run the scripts
    ```
        sh run.sh
    ```

### Run script ###
pybot -L TRACE --variable ENV:alpha -d result testcases/api


**[▲ Back to Top](#table-of-contents)**

## Working with Backend Testing
### Prerequisites

To setup the `credit-pay-be-robot` project, install the following tools on your computer:

* [Python](https://www.python.org/).
To install python [python webpage](https://www.python.org/downloads/).

### Styles and Conventions

Styles should follow [these](https://bitbucket.org/ascendcorp/acm-robot-style-guide/src/master/) standards. 

### Keywords
Keywords must be classified on ``###==== Variables ====###``,  ``###==== Actions ====###`` and ``###==== Validate And Asserts ====###``. Each keyword should be documented.

**[▲ Back to Top](#table-of-contents)**

## Contributing to backend testing

Module Leads: 
[Nhan Ngo](mailto:nhan.ngo@wizeline.com),
[Roberto Oropeza](mailto:roberto.oropeza@wizeline.com),
[Eduardo Avendaño](mailto:eduardo.avendano@team.wizeline.com),
[Oscar Gaytan](mailto:oscar.gaytan@wizeline.com)

### Creating Pull Requests

Title must be clear and up to 75 characters. It should include the Grouping Token,the Issue Tracking Number, if available, and a short description of the PR.

`<grouping-token> - <tracker-number> - <Short description>`


### Merging Pull Requests

To merge a Pull Request follow the next guidelines:

* It should have at least two positive reviews and no pending change or fix requests.
* Tag everybody in a PR. This keeps the code quality high and DRY. Plus, it spreads the word on new features.
* It is the responsibility of the PR author to ask for reviews if nobody has taken a look at the PR, but it is also the responsibility of the team to be responsive to these requests.

**[▲ Back to Top](#table-of-contents)**



## Jenkins pipeline
```
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '99dc37d8-fb13-4231-897b-f34f35bda65b', url: 'git@bitbucket.org:ascendcorp/credit-pay-be-robot.git']]])
            }
        }
        stage('Functional tests') {
            steps {
                sh 'pybot -L TRACE --variable ENV:alpha -d result testcases/api'
            }
        }
    }
    post {
        always {
            step([$class: 'RobotPublisher', disableArchiveOutput: false, enableCache: true, logFileName: 'log.html', onlyCritical: true, otherFiles: '', outputFileName: 'output.xml', outputPath: '', passThreshold: 0.0, reportFileName: 'report.html', unstableThreshold: 0.0])
            publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: '', reportFiles: 'report.html', reportName: 'HTML Report', reportTitles: ''])
            junit 'output.xml'
        }
    }
}
```

**[▲ Back to Top](#table-of-contents)**