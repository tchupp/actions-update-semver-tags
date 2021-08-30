# GitHub Actions: update-semver-tags

GitHub Action for updating semver tags when a release is published.

[SemVer (or Semantic Versioning)](https://semver.org/) is a strategy for versioning with a Major, Minor, and Patch version.

Let's say your latest release is version `v1.2.3`.
It's often convenient to have tags for `v1.2` and `v1` for loose version pinning.

This GitHub Action will update the `v1.2` and `v1` tags when a new release is published.

**[Shut up and show me the copy/paste](#examples)**

## Usage

This action can be used as follows:
```yaml
      - uses: tchupp/actions-update-semver-tags@v1
```

### Assumptions

The most common cause for issues involves a mismatch in expectations.  
Please read below to make sure your setup aligns with the assumptions made by this action.

#### Setup

This action expects that the repo has been checked out.  
The following snippet from an example job, [which can be found below](#simple-setup).

```yaml
...
    steps:
      - name: Checkout
        uses: actions/checkout@v2
...
```

#### Version tags

This action expects that your repo is tagged using semantic versions, ie `v1.2.3`

### Inputs

This action has no inputs.

## Examples

### Simple Setup

```yaml
name: Release Tagger

on:
  push:
    tags:
      - 'v[0-9]+.[0-9]+.[0-9]+'
  release:
    types:
      - published
      - edited

jobs:
  update-semver-tags:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - name: Update Semver Tags
        uses: tchupp/actions-update-semver-tags@v1
```
