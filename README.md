# SECURITY-INSIGHTS Validator

GitHub Action to validate the `SECURITY-INSIGHTS.yml` in the repository. The workflow is based on the Python script [ossf/si-tooling/python](https://github.com/ossf/si-tooling/tree/main/python).

### Sample Workflow

```
name: SECURITY-INSIGHTS Validator

on:
  push:
    paths:
    - 'SECURITY-INSIGHTS.yml'

jobs:
  si-validator:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: SECURITY-INSIGHTS Validator
        uses: luigigubello/security-insights-validator-ga@main
```

