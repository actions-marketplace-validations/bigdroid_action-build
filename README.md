# action-build

## Example workflow

```yml
name: Build Bigdroid

on: tags

jobs:
  publish_release:
    runs-on: ubuntu-latest
    name: Building Bigdroid project
    steps:
      - uses: actions/checkout@v2
      - id: bigdroid-build
        uses: bigdroid/action-build
```