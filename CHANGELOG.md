## treydock-singularity changelog

Release notes for the treydock-singularity module.

------------------------------------------

## [3.0.0](https://github.com/treydock/puppet-module-singularity/tree/3.0.0) (2019-03-20)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/2.0.1...3.0.0)

**Implemented enhancements:**

- README updates and use puppet strings for docs [\#12](https://github.com/treydock/puppet-module-singularity/pull/12) ([treydock](https://github.com/treydock))
- BREAKING: Update singularity.conf to support Singularity 3.1.0 [\#11](https://github.com/treydock/puppet-module-singularity/pull/11) ([treydock](https://github.com/treydock))

## [2.0.1](https://github.com/treydock/puppet-module-singularity/tree/2.0.1) (2018-10-16)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/2.0.0...2.0.1)

**Fixed bugs:**

- Make underlay default match documented default [\#10](https://github.com/treydock/puppet-module-singularity/pull/10) ([treydock](https://github.com/treydock))

## [2.0.0](https://github.com/treydock/puppet-module-singularity/tree/2.0.0) (2018-10-15)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.2.0...2.0.0)

**Implemented enhancements:**

- Add support for Puppet 6 and drop support for Puppet 4 [\#9](https://github.com/treydock/puppet-module-singularity/pull/9) ([treydock](https://github.com/treydock))
- Update singularity.conf to match 3.0.0 [\#8](https://github.com/treydock/puppet-module-singularity/pull/8) ([treydock](https://github.com/treydock))

## [1.2.0](https://github.com/treydock/puppet-module-singularity/tree/1.2.0) (2018-09-14)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.1.0...1.2.0)

**Implemented enhancements:**

- Use beaker 4.x [\#7](https://github.com/treydock/puppet-module-singularity/pull/7) ([treydock](https://github.com/treydock))
- Support new options of Singularity-2.6.0 [\#6](https://github.com/treydock/puppet-module-singularity/pull/6) ([mrolli](https://github.com/mrolli))

## [1.1.0](https://github.com/treydock/puppet-module-singularity/tree/1.1.0) (2018-05-01)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.0.1...1.1.0)

**Implemented enhancements:**

- Add limit\_container\_groups parameter which was added in Singularity 2.5.0 [\#5](https://github.com/treydock/puppet-module-singularity/pull/5) ([treydock](https://github.com/treydock))

## [1.0.1](https://github.com/treydock/puppet-module-singularity/tree/1.0.1) (2018-05-01)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.0.0...1.0.1)

**Fixed bugs:**

- Fixed boolean error when using provided hiera parameters [\#4](https://github.com/treydock/puppet-module-singularity/pull/4) ([kreczko](https://github.com/kreczko))

## [1.0.0](https://github.com/treydock/puppet-module-singularity/tree/1.0.0) (2018-03-19)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.1.0...1.0.0)

**Implemented enhancements:**

- BREAKING: Drop Puppet 3 support [\#3](https://github.com/treydock/puppet-module-singularity/pull/3) ([treydock](https://github.com/treydock))
- BREAKING: Change default for enable\_overlay to 'try' [\#2](https://github.com/treydock/puppet-module-singularity/pull/2) ([treydock](https://github.com/treydock))

## [0.1.0](https://github.com/treydock/puppet-module-singularity/tree/0.1.0) (2017-10-12)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.0.2...0.1.0)

**Implemented enhancements:**

- Add support for Singularity 2.4 [\#1](https://github.com/treydock/puppet-module-singularity/pull/1) ([treydock](https://github.com/treydock))

## [0.0.2](https://github.com/treydock/puppet-module-singularity/tree/0.0.2) (2017-08-15)
[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.0.1...0.0.2)

* Fix enable_overlay to default to `no` on systems that don't support overlayfs

## [0.0.1](https://github.com/treydock/puppet-module-singularity/tree/0.0.1) (2017-08-07)

* Initial release
