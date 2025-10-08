# Doctrine Docs Builder

A package for generating Doctrine repo docs in a unified way. Its purpose is to abstract the underlying method away from
the generating command. It assumes the input directory is in `docs/en` at the root of the repo (for now).

## Usage:

```shell
composer require --dev doctrine/docs-builder
./vendor/bin/build-docs.sh [<output>]
```

The output directory defaults to `output` at the root of your project.

Optionally, declare a script in your root `composer.json` for convenience:

```
"scripts": {
    "docs": "./vendor/bin/build-docs.sh @additional_args"
}
```

Then run `composer docs [<output>]`.

