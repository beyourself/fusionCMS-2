# Instantiator

This library provides a way of avoiding usage of constructors when instantiating PHP classes.

[![Build Status](http://travis-ci.org/doctrine/instantiator.svg?branch=master)](http://travis-ci.org/doctrine/instantiator)
[![Code Coverage](http://scrutinizer-ci.com/g/doctrine/instantiator/badges/coverage.png?b=master)](http://scrutinizer-ci.com/g/doctrine/instantiator/?branch=master)
[![Scrutinizer Code Quality](http://scrutinizer-ci.com/g/doctrine/instantiator/badges/quality-score.png?b=master)](http://scrutinizer-ci.com/g/doctrine/instantiator/?branch=master)
[![Dependency Status](http://www.versioneye.com/package/php--doctrine--instantiator/badge.svg)](http://www.versioneye.com/package/php--doctrine--instantiator)
[![HHVM Status](http://hhvm.h4cc.de/badge/doctrine/instantiator.png)](http://hhvm.h4cc.de/package/doctrine/instantiator)

[![Latest Stable Version](http://poser.pugx.org/doctrine/instantiator/v/stable.png)](http://packagist.org/packages/doctrine/instantiator)
[![Latest Unstable Version](http://poser.pugx.org/doctrine/instantiator/v/unstable.png)](http://packagist.org/packages/doctrine/instantiator)

## Installation

The suggested installation method is via [composer](http://getcomposer.org/):

```sh
php composer.phar require "doctrine/instantiator:~1.0.3"
```

## Usage

The instantiator is able to create new instances of any class without using the constructor or any API of the class
itself:

```php
$instantiator = new \Doctrine\Instantiator\Instantiator();

$instance = $instantiator->instantiate('My\\ClassName\\Here');
```

## Contributing

Please read the [CONTRIBUTING.md](CONTRIBUTING.md) contents if you wish to help out!

## Credits

This library was migrated from [ocramius/instantiator](http://github.com/Ocramius/Instantiator), which
has been donated to the doctrine organization, and which is now deprecated in favour of this package.
