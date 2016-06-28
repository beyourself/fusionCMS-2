# PHPUnit

PHPUnit is a programmer-oriented testing framework for PHP. It is an instance of the xUnit architecture for unit testing frameworks.

[![Latest Stable Version](http://img.shields.io/packagist/v/phpunit/phpunit.svg?style=flat-square)](http://packagist.org/packages/phpunit/phpunit)
[![Minimum PHP Version](http://img.shields.io/badge/php-%3E%3D%205.6-8892BF.svg?style=flat-square)](http://php.net/)
[![Build Status](http://img.shields.io/travis/sebastianbergmann/phpunit/master.svg?style=flat-square)](http://travis-ci.org/sebastianbergmann/phpunit)

## Installation

We distribute a [PHP Archive (PHAR)](http://php.net/phar) that has all required (as well as some optional) dependencies of PHPUnit bundled in a single file:

```bash
$ wget http://phar.phpunit.de/phpunit.phar

$ chmod +x phpunit.phar

$ mv phpunit.phar /usr/local/bin/phpunit
```

You can also immediately use the PHAR after you have downloaded it, of course:

```bash
$ wget http://phar.phpunit.de/phpunit.phar

$ php phpunit.phar
```

Alternatively, you may use [Composer](http://getcomposer.org/) to download and install PHPUnit as well as its dependencies. Please refer to the [documentation](http://phpunit.de/documentation.html) for details on how to do this.

## Contribute

Please refer to [CONTRIBUTING.md](http://github.com/sebastianbergmann/phpunit/blob/master/CONTRIBUTING.md) for information on how to contribute to PHPUnit and its related projects.

## List of Contributors

Thanks to everyone who has contributed to PHPUnit! You can find a detailed list of contributors on every PHPUnit related package on GitHub. This list shows only the major components:

* [PHPUnit](http://github.com/sebastianbergmann/phpunit/graphs/contributors)
* [PHP_CodeCoverage](http://github.com/sebastianbergmann/php-code-coverage/graphs/contributors)
* [PHPUnit_MockObject](http://github.com/sebastianbergmann/phpunit-mock-objects/graphs/contributors)

A very special thanks to everyone who has contributed to the documentation and helps maintain the translations:

* [PHPUnit Documentation](http://github.com/sebastianbergmann/phpunit-documentation/graphs/contributors)

