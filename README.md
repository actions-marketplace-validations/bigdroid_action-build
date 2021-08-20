# action-build

## Example workflow

```yml
on: tags

jobs:
  publish_release:
    runs-on: ubuntu-latest
    name: Building your Bigdroid project
    steps:
      - uses: actions/checkout@v2
      - id: bigdroid-build
        uses: bigdroid/action-build@0.1.0
```