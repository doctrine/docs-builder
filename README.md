# Doctrine Docs Builder

A package for generating Doctrine repo docs in a unified way. Its purpose is to abstract the underlying method away from
the generating command. It assumes:

- it's run from the project root, and
- the docs reside in `docs/en/`. 

It uses [phpdocumentor](https://github.com/phpDocumentor/guides) tooling for parsing the RST files.

This project is considered an internal tool and therefore, you shouldn't use this project in your application. This 
repository doesn't provide any support, and doesn't guarantee backward compatibility. Any or the entire project can 
change, or even disappear, at any moment without prior notice.

## Usage:

```shell
composer require --dev doctrine/docs-builder -d docs
./docs/vendor/bin/build-docs.sh [<output>]
```

The output directory defaults to `docs/output`.

Optionally, declare a script in your root `composer.json` for convenience:

```
"scripts": {
    "docs": "./docs/vendor/bin/build-docs.sh @additional_args"
}
```

Then run `composer docs [<output>]`.

