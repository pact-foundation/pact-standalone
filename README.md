# Pact Standalone

![Build](https://github.com/pact-foundation/pact-standalone/workflows/Build/badge.svg)

Creates a standalone pact command line executable containing

- The rust pact implementation via a single executable
- The ruby pact implementation via Traveling Ruby

## Package contents

This version (2.5.5) of the Pact standalone executables package contains:

  * [pact-cli](https://github.com/you54f/pact-cli)
  * [pact-broker-cli](https://github.com/pact-foundation/pact-broker-cli)
  * [pact-plugin-cli](https://github.com/pact-foundation/pact-plugins/tree/main/cli)
  * [pact_mock_server_cli](https://github.com/pact-foundation/pact-core-mock-server/tree/main/pact_mock_server_cli)
  * [pact_verifier_cli](https://github.com/pact-foundation/pact-reference/tree/master/rust/pact_verifier_cli)
  * [pact-stub-server](https://github.com/pact-foundation/pact-stub-server)
  * pact gem 1.67.2
  * pact-mock_service gem 3.12.3
  * pact-support gem 1.21.2
  * pact-provider-verifier gem 1.39.1
  * pact_broker-client gem 1.77.0
  * pact-message gem 0.11.1

Binaries will be extracted into `pact/bin`:

```
./pact/bin/
├── pact
├── pact-broker (legacy) - use `pact broker`
├── pactflow (legacy) - use `pact pactflow`
├── pact-message (legacy) - use `pact mock` (consumer) / `pact verifier` (provider)
├── pact-mock-service (legacy) - use `pact mock`
├── pact-provider-verifier (legacy) - use `pact verifier`
└── pact-stub-service (legacy) - use `pact stub`
```

Note: from `v2.6.0+`, the legacy commands will redirect to the new cli executables built in rust.

Existing behaviour can be preserved by setting the `PACT_CLI_LEGACY` environment variable.

In `v3.0.0`, the ruby runtime will be removed completely, and all commands will link to the rust executables.

Longer term, this package is likely to be deprecated, replaced with a single `pact` cli executable.

### Windows Users

Please append `.bat` to any of the provided ruby-based binaries

eg.

├── pact-broker (legacy)
├── pactflow (legacy)
├── pact-message (legacy)
├── pact-mock-service (legacy)
├── pact-provider-verifier (legacy)
└── pact-stub-service

```ps1
  .\pact\bin\pact-broker.bat
```

## Installation

See the [release page][releases].

[releases]: https://github.com/pact-foundation/pact-standalone/releases

## Supported Platforms

Ruby is not required on the host platform, Ruby 3.3.9 is provided in the distributable.

| OS     | Ruby      | Architecture   | Supported |
| -------| -------   | ------------   | --------- |
| MacOS  | 3.3.9     | x86_64         | ✅        |
| MacOS  | 3.3.9     | aarch64 (arm64)| ✅        |
| Linux  | 3.3.9     | x86_64         | ✅        |
| Linux  | 3.3.9     | aarch64 (arm64)| ✅        |
| Windows| 3.3.9     | x86_64         | ✅        |
| Windows| 3.3.9     | aarch64 (arm64)| 🚧        |
| Windows| N/A.      | aarch64 (arm64)| ✅        |

🚧 - Tested under emulation mode x86_64 in Windows on ARM

Windows-arm64 package supports rust based executables only and does not provide an arm64 runtime currently.

To use ruby packages on windows on arm, please use the x86_64 package.

## Usage

<a name="pact-mock-service"></a>
### pact-mock-service

```
Standalone Pact mock server

Usage: pact mock [OPTIONS] [COMMAND]

Commands:
  start            Starts the master mock server
  list             Lists all the running mock servers
  create           Creates a new mock server from a pact file
  verify           Verify the mock server by id or port number, and generate a pact file if all ok
  shutdown         Shutdown the mock server by id or port number, releasing all its resources
  shutdown-master  Performs a graceful shutdown of the master server (displayed when it started)
  help             Print this message or the help of the given subcommand(s)

Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --help
          Print help and exit
      --enable-otel-logs
          Enable OpenTelemetry logging
  -v, --version
          Print version information and exit
      --enable-otel-traces
          Enable OpenTelemetry traces
  -p, --port <port>
          port the master mock server runs on (defaults to 8080)
  -h, --host <host>
          hostname the master mock server runs on (defaults to localhost)
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
  -l, --loglevel <loglevel>
          Log level for mock servers to write to the log file (defaults to info) [possible values: error, warn, info, debug, trace, none]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --no-term-log
          Turns off using terminal ANSI escape codes
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --no-file-log
          Do not log to an output file
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]

```

<a name="pact-stub-service"></a>
### pact-stub-service

```
Pact Stub Server 0.6.3

Usage: pact stub [OPTIONS]

Options:
      --enable-otel
          Enable OpenTelemetry tracing
  -l, --loglevel <loglevel>
          Log level (defaults to info) [default: info] [possible values: error, warn, info, debug, trace, none]
      --enable-otel-logs
          Enable OpenTelemetry logging
  -f, --file <file>
          Pact file to load (can be repeated)
  -d, --dir <dir>
          Directory of pact files to load (can be repeated)
      --enable-otel-traces
          Enable OpenTelemetry traces
  -e, --extension <ext>
          File extension to use when loading from a directory (default is json)
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
  -u, --url <url>
          URL of pact file to fetch (can be repeated)
  -b, --broker-url <broker-url>
          URL of the pact broker to fetch pacts from [env: PACT_BROKER_BASE_URL=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --user <user>
          User and password to use when fetching pacts from URLS or Pact Broker in user:password form
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -t, --token <token>
          Bearer token to use when fetching pacts from URLS or Pact Broker
  -p, --port <port>
          Port to run on (defaults to random port assigned by the OS)
  -o, --cors
          Automatically respond to OPTIONS requests and return default CORS headers
      --cors-referer
          Set the CORS Access-Control-Allow-Origin header to the Referer
      --insecure-tls
          Disables TLS certificate validation
  -s, --provider-state <provider-state>
          Provider state regular expression to filter the responses by
      --provider-state-header-name <provider-state-header-name>
          Name of the header parameter containing the provider state to be used in case multiple matching interactions are found
      --empty-provider-state
          Include empty provider states when filtering with --provider-state
      --consumer-name <consumer-name>
          Consumer name or regex to use to filter the Pacts fetched from the Pact broker (can be repeated)
      --provider-name <provider-name>
          Provider name or regex to use to filter the Pacts fetched from the Pact broker (can be repeated)
  -v, --version
          Print version information
  -h, --help
          Print help

```

<a name="pact-provider-verifier"></a>
### pact-provider-verifier

```
Standalone pact verifier for provider pact verification

Usage: pact verifier [OPTIONS]

Options:
      --enable-otel
          Enable OpenTelemetry tracing
      --help
          Print help and exit
      --enable-otel-logs
          Enable OpenTelemetry logging
  -v, --version
          Print version information and exit
      --enable-otel-traces
          Enable OpenTelemetry traces
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]

Logging options:
  -l, --loglevel <loglevel>  Log level to emit log events at (defaults to warn) [possible values: error, warn, info, debug, trace, none]
      --pretty-log           Emits excessively pretty, multi-line logs, optimized for human readability.
      --full-log             This emits human-readable, single-line logs for each event that occurs, with the current span context displayed before the formatted representation of the event.
      --compact-log          Emit logs optimized for short line lengths.
  -j, --json <json-file>     Generate a JSON report of the verification [env: PACT_VERIFIER_JSON_REPORT=]
  -x, --junit <junit-file>   Generate a JUnit XML report of the verification (requires the junit feature) [env: PACT_VERIFIER_JUNIT_REPORT=]
      --no-colour            Disables ANSI escape codes in the output [aliases: --no-color]

Loading pacts options:
  -f, --file <file>
          Pact file to verify (can be repeated)
  -d, --dir <dir>
          Directory of pact files to verify (can be repeated)
  -u, --url <url>
          URL of pact file to verify (can be repeated)
  -b, --broker-url <broker-url>
          URL of the pact broker to fetch pacts from to verify (requires the provider name parameter) [env: PACT_BROKER_BASE_URL=]
      --webhook-callback-url <webhook-callback-url>
          URL of a Pact to verify via a webhook callback. Requires the broker-url to be set. [env: PACT_WEBHOOK_CALLBACK_URL=]
      --ignore-no-pacts-error
          Do not fail if no pacts are found to verify

Authentication options:
      --user <user>          Username to use when fetching pacts from URLS [env: PACT_BROKER_USERNAME=]
      --password <password>  Password to use when fetching pacts from URLS [env: PACT_BROKER_PASSWORD=]
  -t, --token <token>        Bearer token to use when fetching pacts from URLS [env: PACT_BROKER_TOKEN=]

Provider options:
  -h, --hostname <hostname>
          Provider hostname (defaults to localhost) [env: PACT_PROVIDER_HOSTNAME=]
  -p, --port <port>
          Provider port (defaults to protocol default 80/443) [env: PACT_PROVIDER_PORT=]
      --transport <transport>
          Provider protocol transport to use (http, https, grpc, etc.) [env: PACT_PROVIDER_TRANSPORT=] [default: http]
      --transports <transports>
          Allows multiple protocol transports to be configured (http, https, grpc, etc.) with their associated port numbers separated by a colon. For example, use --transports http:8080 grpc:5555 to configure both.
  -n, --provider-name <provider-name>
          Provider name (defaults to provider) [env: PACT_PROVIDER_NAME=]
      --base-path <base-path>
          Base path to add to all requests [env: PACT_PROVIDER_BASE_PATH=]
      --request-timeout <request-timeout>
          Sets the HTTP request timeout in milliseconds for requests to the target API and for state change requests. [env: PACT_PROVIDER_REQUEST_TIMEOUT=]
  -H, --header <custom-header>
          Add a custom header to be included in the calls to the provider. Values must be in the form KEY=VALUE, where KEY and VALUE contain ASCII characters (32-127) only. Can be repeated.
      --disable-ssl-verification
          Disables validation of SSL certificates

Provider state options:
  -s, --state-change-url <state-change-url>
          URL to post state change requests to [env: PACT_PROVIDER_STATE_CHANGE_URL=]
      --state-change-as-query
          State change request data will be sent as query parameters instead of in the request body [env: PACT_PROVIDER_STATE_CHANGE_AS_QUERY=]
      --state-change-teardown
          State change teardown requests are to be made after each interaction [env: PACT_PROVIDER_STATE_CHANGE_TEARDOWN=]

Filtering interactions:
      --filter-description <filter-description>
          Only validate interactions whose descriptions match this filter (regex format) [env: PACT_DESCRIPTION=]
      --filter-state <filter-state>
          Only validate interactions whose provider states match this filter (regex format) [env: PACT_PROVIDER_STATE=]
      --filter-no-state
          Only validate interactions that have no defined provider state [env: PACT_PROVIDER_NO_STATE=]
  -c, --filter-consumer <filter-consumer>
          Consumer name to filter the pacts to be verified (can be repeated)

Publishing options:
      --publish
          Enables publishing of verification results back to the Pact Broker. Requires the broker-url and provider-version parameters.
      --provider-version <provider-version>
          Provider version that is being verified. This is required when publishing results.
      --build-url <build-url>
          URL of the build to associate with the published verification results.
      --provider-tags <provider-tags>
          Provider tags to use when publishing results. Accepts comma-separated values.
      --provider-branch <provider-branch>
          Provider branch to use when publishing results

Pact Broker options:
      --consumer-version-tags <consumer-version-tags>
          Consumer tags to use when fetching pacts from the Broker. Accepts comma-separated values.
      --consumer-version-selectors <consumer-version-selectors>
          Consumer version selectors to use when fetching pacts from the Broker. Accepts a JSON string as per https://docs.pact.io/pact_broker/advanced_topics/consumer_version_selectors/. Can be repeated.
      --enable-pending
          Enables Pending Pacts
      --include-wip-pacts-since <include-wip-pacts-since>
          Allow pacts that don't match given consumer selectors (or tags) to  be verified, without causing the overall task to fail. For more information, see https://pact.io/wip

Development options:
      --exit-on-first-error  Stops the verifier at the first failure
      --last-failed          Only runs the interactions that failed on the previous verifier run. Requires --json-file to have been set
```

<a name="pact-broker-client"></a>
### pact-broker client

To connect to a Pact Broker that uses custom SSL cerificates, set the environment variable `$SSL_CERT_FILE` or `$SSL_CERT_DIR` to a path that contains the appropriate certificate.

<a name="pact-broker-client-publish"></a>
#### publish

```
Publishes pacts to the Pact Broker

Usage: pact broker publish [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> <PACT_FILES_DIRS_OR_GLOBS>...

Arguments:
  <PACT_FILES_DIRS_OR_GLOBS>...
          
          Glob pattern to match pact files to publish
          
          ?      matches any single character.
          *      matches any (possibly empty) sequence of characters.
          **     matches the current directory and arbitrary subdirectories. This sequence must form
                   a single path component, so both **a and b** are invalid and will result in an
                   error. A sequence of more than two consecutive * characters is also invalid.
          [...]  matches any character inside the brackets. Character sequences can also specify
                   ranges of characters, as ordered by Unicode, so e.g. [0-9] specifies any character
                   between 0 and 9 inclusive. An unclosed bracket is invalid.
          [!...] is the negation of [...], i.e. it matches any characters not in the brackets.
          
          The metacharacters ?, *, [, ] can be matched by using brackets (e.g. [?]). When a ]
          occurs immediately following [ or [! then it is interpreted as being part of, rather
          then ending, the character set, so ] and NOT ] can be matched by []] and [!]] respectively.
          The - character can be specified inside a character sequence pattern by placing it at
          the start or the end, e.g. [abc-].
          
          See https://docs.rs/glob/0.3.0/glob/struct.Pattern.html

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

      --enable-otel
          Enable OpenTelemetry tracing

      --enable-otel-logs
          Enable OpenTelemetry logging

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

      --enable-otel-traces
          Enable OpenTelemetry traces

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp)
          
          [env: OTEL_TRACES_EXPORTER=]

      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp)
          
          [env: OTEL_EXPORTER_OTLP_ENDPOINT=]

      --validate
          Validate the Pact files before publishing.

      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http)
          
          [env: OTEL_EXPORTER_OTLP_PROTOCOL=]
          [default: http]
          [possible values: http, http/protobuf]

      --strict
          Require strict validation.

  -a, --consumer-app-version <consumer-app-version>
          The consumer application version

      --branch <branch>
          Repository branch of the consumer version

      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace)
          
          [default: off]
          [possible values: off, none, error, warn, info, debug, trace]

  -r, --auto-detect-version-properties
          Automatically detect the repository commit, branch and build URL from known CI environment variables or git CLI. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.

  -t, --tag [<tag>...]
          Tag name for consumer version. Can be specified multiple times (delimiter ,).

      --tag-with-git-branch
          Tag consumer version with the name of the current git branch. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.

      --build-url <build-url>
          The build URL that created the pact

      --merge
          If a pact already exists for this consumer version and provider, merge the contents. Useful when running Pact tests concurrently on different build nodes.

  -o, --output <OUTPUT>
          Value must be one of ["json", "text", "pretty"]
          
          [default: text]
          [possible values: json, text, pretty]

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

  -h, --help
          Print help (see a summary with '-h')
```

<a name="pact-broker-client-can-i-deploy"></a>
#### can-i-deploy

```
Usage: pact broker can-i-deploy [OPTIONS] --pacticipant <PACTICIPANT> --broker-base-url <PACT_BROKER_BASE_URL>

Options:
  -a, --pacticipant <PACTICIPANT>
          The pacticipant name. Use once for each pacticipant being checked. The following options (--version, --latest, --tag, --branch, --main-branch, --no-main-branch, --skip-main-branch) must come after each --pacticipant.

      --enable-otel
          Enable OpenTelemetry tracing

  -e, --version <VERSION>
          The pacticipant version. Must be entered after the --pacticipant that it relates to.

      --enable-otel-logs
          Enable OpenTelemetry logging

      --enable-otel-traces
          Enable OpenTelemetry traces

  -l, --latest [<TAG>]
          Use the latest pacticipant version. Optionally specify a TAG to use the latest version with the specified tag. Must be entered after the --pacticipant that it relates to.

      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp)
          
          [env: OTEL_TRACES_EXPORTER=]

      --tag <TAG>
          The tag of the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --branch <BRANCH>
          The branch of the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp)
          
          [env: OTEL_EXPORTER_OTLP_ENDPOINT=]

      --main-branch
          Use the latest version of the configured main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http)
          
          [env: OTEL_EXPORTER_OTLP_PROTOCOL=]
          [default: http]
          [possible values: http, http/protobuf]

      --no-main-branch <no-main-branch>
          Do not use the main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace)
          
          [default: off]
          [possible values: off, none, error, warn, info, debug, trace]

      --skip-main-branch <skip-main-branch>
          Skip the configured main branch of the pacticipant as the version for which you want to check the verification results. Must be entered after the --pacticipant that it relates to.

      --ignore <ignore>
          The pacticipant name to ignore. Use once for each pacticipant being ignored. A specific version can be ignored by also specifying a --version after the pacticipant name option. The environment variable PACT_BROKER_CAN_I_DEPLOY_IGNORE may also be used to specify a pacticipant name to ignore, with commas to separate multiple pacticipant names if necessary.

      --to-environment <ENVIRONMENT>
          The environment into which the pacticipant(s) are to be deployed

      --to <TO>
          The tag that represents the branch or environment of the integrated applications for which you want to check the verification result status.

  -o, --output <OUTPUT>
          Value must be one of ["json", "table"]
          
          [default: table]
          [possible values: json, table]

      --retry-while-unknown <TIMES>
          The number of times to retry while there is an unknown verification result (ie. the provider verification is likely still running)

      --retry-interval <SECONDS>
          The time between retries in seconds. Use in conjuction with --retry-while-unknown

      --dry-run
          When dry-run is enabled, always exit process with a success code. Can also be enabled by setting the environment variable PACT_BROKER_CAN_I_DEPLOY_DRY_RUN=true. This mode is useful when setting up your CI/CD pipeline for the first time, or in a 'break glass' situation where you need to knowingly deploy what Pact considers a breaking change. For the second scenario, it is recommended to use the environment variable and just set it for the build required to deploy that particular version, so you don't accidentally leave the dry run mode enabled.

  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker
          
          [env: PACT_BROKER_BASE_URL=]

  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username
          
          [env: PACT_BROKER_USERNAME=]

  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password
          
          [env: PACT_BROKER_PASSWORD=]

  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token
          
          [env: PACT_BROKER_TOKEN=]

  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file
          
          [env: SSL_CERT_FILE=]

      --skip-ssl-verification
          Skip SSL certificate verification
          
          [env: SSL_SKIP_VERIFICATION=]

      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification
          
          [env: SSL_TRUST_STORE=]
          [default: true]
          [possible values: true, false]

  -h, --help
          Print help (see a summary with '-h')

    Check if a pacticipant can be deployed.

    Description:
    Returns exit code 0 or 1, indicating whether or not the specified application (pacticipant) has a successful verification result with
    each of the application versions that are already deployed to a particular environment. Prints out the relevant pact/verification
    details, indicating any missing or failed verification results.
  
    The can-i-deploy tool was originally written to support specifying versions and dependencies using tags. This usage has now been
    superseded by first class support for environments, deployments and releases. For documentation on how to use can-i-deploy with tags,
    please see https://docs.pact.io/pact_broker/client_cli/can_i_deploy_usage_with_tags/
  
    Before `can-i-deploy` can be used, the relevant environment resources must first be created in the Pact Broker using the
    `create-environment` command. The 'test' and 'production' environments will have been seeded for you. You can check the existing
    environments by running `pact broker list-environments`. See https://docs.pact.io/pact_broker/client_cli/readme#environments for more
    information.

    $ pact broker create-environment --name 'uat' --display-name 'UAT' --no-production

    After an application is deployed or released, its deployment must be recorded using the `record-deployment` or `record-release`
    commands. See https://docs.pact.io/pact_broker/recording_deployments_and_releases/ for more information.
  
    $ pact broker record-deployment --pacticipant Foo --version 173153ae0 --environment uat
  
    Before an application is deployed or released to an environment, the can-i-deploy command must be run to check that the application
    version is safe to deploy with the versions of each integrated application that are already in that environment.
  
    $ pact broker can-i-deploy --pacticipant PACTICIPANT --version VERSION --to-environment ENVIRONMENT
  
    Example: can I deploy version 173153ae0 of application Foo to the test environment?
  
    $ pact broker can-i-deploy --pacticipant Foo --version 173153ae0 --to-environment test
  
    Can-i-deploy can also be used to check if arbitrary versions have a successful verification. When asking 'Can I deploy this
    application version with the latest version from the main branch of another application' it functions as a 'can I merge' check.
  
    $ pact broker can-i-deploy --pacticipant Foo 173153ae0 \\ --pacticipant Bar --latest main
  
    ##### Polling
  
    If the verification process takes a long time and there are results missing when the can-i-deploy command runs in your CI/CD pipeline,
    you can configure the command to poll and wait for the missing results to arrive. The arguments to specify are `--retry-while-unknown
    TIMES` and `--retry-interval SECONDS`, set to appropriate values for your pipeline.
```

<a name="pact"></a>

<a name="pactflow-client"></a>
### pactflow client

#### publish-provider-contract

```
Publish provider contract to PactFlow

Usage: pact pactflow publish-provider-contract [OPTIONS] --broker-base-url <PACT_BROKER_BASE_URL> --provider <PROVIDER> <CONTRACT_FILE>

Arguments:
  <CONTRACT_FILE>  The contract file to publish

Options:
  -b, --broker-base-url <PACT_BROKER_BASE_URL>
          The base URL of the Pact Broker [env: PACT_BROKER_BASE_URL=]
      --enable-otel
          Enable OpenTelemetry tracing
      --enable-otel-logs
          Enable OpenTelemetry logging
  -u, --broker-username <PACT_BROKER_USERNAME>
          Pact Broker basic auth username [env: PACT_BROKER_USERNAME=]
      --enable-otel-traces
          Enable OpenTelemetry traces
  -p, --broker-password <PACT_BROKER_PASSWORD>
          Pact Broker basic auth password [env: PACT_BROKER_PASSWORD=]
  -k, --broker-token <PACT_BROKER_TOKEN>
          Pact Broker bearer token [env: PACT_BROKER_TOKEN=]
      --otel-exporter <otel-exporter>
          The OpenTelemetry exporter(s) to use, comma separated (stdout, otlp) [env: OTEL_TRACES_EXPORTER=]
      --otel-exporter-endpoint <otel-exporter-endpoint>
          The endpoint to use for the OTLP exporter (required if --otel-exporter=otlp) [env: OTEL_EXPORTER_OTLP_ENDPOINT=]
      --provider <PROVIDER>
          The provider name
  -a, --provider-app-version <PROVIDER_APP_VERSION>
          The provider application version
      --otel-exporter-protocol <otel-exporter-protocol>
          The protocol to use for the OTLP exporter (http/protobuf, http) [env: OTEL_EXPORTER_OTLP_PROTOCOL=] [default: http] [possible values: http, http/protobuf]
      --branch <BRANCH>
          Repository branch of the provider version
      --log-level <LEVEL>
          Set the log level (none, off, error, warn, info, debug, trace) [default: off] [possible values: off, none, error, warn, info, debug, trace]
  -t, --tag [<tag>...]
          Tag name for provider version. Can be specified multiple times (delimiter ,).
      --specification <SPECIFICATION>
          The contract specification [default: oas]
      --content-type <CONTENT_TYPE>
          The content type. eg. application/yml
      --verification-success
          Whether or not the self verification passed successfully.
      --no-verification-success
          Whether or not the self verification failed.
      --verification-exit-code <N>
          The exit code of the verification process. Can be used instead of --verification-success|--no-verification-success for a simpler build script.
      --verification-results <VERIFICATION_RESULTS>
          The path to the file containing the output from the verification process
      --verification-results-content-type <VERIFICATION_RESULTS_CONTENT_TYPE>
          The content type of the verification output eg. text/plain, application/yaml
      --verification-results-format <VERIFICATION_RESULTS_FORMAT>
          The format of the verification output eg. junit, text
      --verifier <VERIFIER>
          The tool used to verify the provider contract
      --verifier-version <VERIFIER_VERSION>
          The version of the tool used to verify the provider contract
      --build-url <BUILD_URL>
          The build URL that created the provider contract
  -r, --auto-detect-version-properties
          Automatically detect the repository commit, branch and build URL from known CI environment variables or git CLI. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.
      --tag-with-git-branch
          Tag provider version with the name of the current git branch. Supports Buildkite, Circle CI, Travis CI, GitHub Actions, Jenkins, Hudson, AppVeyor, GitLab, CodeShip, Bitbucket and Azure DevOps.
  -o, --output <OUTPUT>
          Value must be one of ["json", "text"] [default: text] [possible values: json, text]
  -c, --ssl-certificate <SSL_CERT_FILE>
          The path to a valid SSL certificate file [env: SSL_CERT_FILE=]
      --skip-ssl-verification
          Skip SSL certificate verification [env: SSL_SKIP_VERIFICATION=]
      --ssl-trust-store <SSL_TRUST_STORE>
          Use the system's root trust store for SSL verification [env: SSL_TRUST_STORE=] [default: true] [possible values: true, false]
  -h, --help
          Print help

```

### pact

<a name="pact-docs"></a>
#### docs
```
Usage:
  pact docs

Options:
  [--pact-dir=PACT_DIR]  # Directory containing the pacts
                         # Default: /home/runner/work/pact-standalone/pact-standalone/build/tmp/spec/pacts
  [--doc-dir=DOC_DIR]    # Documentation directory
                         # Default: /home/runner/work/pact-standalone/pact-standalone/build/tmp/doc/pacts

Generate Pact documentation in markdown

```

### pact-message

```
Commands:
  pact-message help [COMMAND]                                                ...
  pact-message reify                                                         ...
  pact-message update MESSAGE_JSON --consumer=CONSUMER --pact-dir=PACT_DIR --...
  pact-message version                                                       ...


```

## Troubleshooting

### SSL

To connect to a Pact Broker that uses custom SSL certificates, set the environment variable `$SSL_CERT_FILE` or `$SSL_CERT_DIR` to a path that contains the appropriate certificate.
