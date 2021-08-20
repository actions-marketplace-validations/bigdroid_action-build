# action-build

## Example workflow

```yml
name: Build Bigdroid Project

on: tags

jobs:
  publish_release:
    runs-on: ubuntu-latest
    name: Building Bigdroid project
    steps:
      - uses: actions/checkout@v2
      - id: bigdroid-build
        uses: bigdroid/action-build
		env:
			API_GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```