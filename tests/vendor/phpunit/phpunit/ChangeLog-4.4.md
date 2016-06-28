# Changes in PHPUnit 4.4

All notable changes of the PHPUnit 4.4 release series are documented in this file using the [Keep a CHANGELOG](http://keepachangelog.com/) principles.

## [4.4.5] - 2015-01-27

### Fixed

* Fixed [#1592](http://github.com/sebastianbergmann/phpunit/issues/1592): Incorrect dependency information

## [4.4.4] - 2015-01-24

### Fixed

* Fixed [#1587](http://github.com/sebastianbergmann/phpunit/issues/1587): Class `SebastianBergmann\Exporter\Context` not found

## [4.4.3] - 2015-01-24

New PHAR release due to updated dependencies

## [4.4.2] - 2015-01-17

### Changed

* Merged [#1573](http://github.com/sebastianbergmann/phpunit/issues/1573): Updates for the XSD for PHPUnit XML configuration

### Fixed

* Merged [#1567](http://github.com/sebastianbergmann/phpunit/issues/1567): `coverage-crap4j` missing in XSD for PHPUnit XML configuration
* Fixed [#1570](http://github.com/sebastianbergmann/phpunit/issues/1570): Test that prints output is marked as failure and not as risky when `--disallow-test-output` is used
* Fixed `--stderr` with `--tap` or `--testdox` options

## [4.4.1] - 2014-12-28

### Changed

* Merged [#1528](http://github.com/sebastianbergmann/phpunit/issues/1528): Add `expectedCount()` to `toString()` return value

## [4.4.0] - 2014-12-05

### Added

* Merged [#1371](http://github.com/sebastianbergmann/phpunit/issues/1371): Implement `assertArraySubset()` assertion
* Merged [#1439](http://github.com/sebastianbergmann/phpunit/issues/1439): Add support for `double` to `assertInternalType()`

### Changed

* Merged [#1427](http://github.com/sebastianbergmann/phpunit/issues/1427): Improve failure output for tests when provided data is binary
* Merged [#1458](http://github.com/sebastianbergmann/phpunit/issues/1458): Only enable colors when PHPUnit is run on a console (and output is not sent to a file)

[4.4.5]: http://github.com/sebastianbergmann/phpunit/compare/4.4.4...4.4.5
[4.4.4]: http://github.com/sebastianbergmann/phpunit/compare/4.4.3...4.4.4
[4.4.3]: http://github.com/sebastianbergmann/phpunit/compare/4.4.2...4.4.3
[4.4.2]: http://github.com/sebastianbergmann/phpunit/compare/4.4.1...4.4.2
[4.4.1]: http://github.com/sebastianbergmann/phpunit/compare/4.4.0...4.4.1
[4.4.0]: http://github.com/sebastianbergmann/phpunit/compare/4.3...4.4.0

