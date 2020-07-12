# release-gem

Github action that bumps the version, generates the changelog, releases the gem, and creates a Github release,

This action uses the [conventional_changelog](https://github.com/dcrec1/conventional-changelog-ruby) gem to update the CHANGELOG.md file, and the [bump](https://github.com/gregorym/bump) gem to handle the version increments. It assumes that the repository is using [conventional commits](https://www.conventionalcommits.org/). The gem dependencies in the action are managed independently from the dependencies of the gem that is being released.

Feel free to use this action for gems outside the Pact Foundation, however, its intent is only for Pact Foundation gems, so if you want to make any changes, please fork it and maintain your own version.

## Usage

In your workflow YAML file:

```
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        fetch-depth: 0
    - uses: pact-foundation/release-gem@v0.0.1
      env:
        GEM_HOST_API_KEY: '${{ secrets.RUBYGEMS_API_KEY }}'
        GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}'
```

You will need to create the `RUBYGEMS_API_KEY` secret yourself, however, the GITHUB_TOKEN is provided by default.
