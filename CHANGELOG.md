# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v5.2.1](https://github.com/treydock/puppet-module-singularity/tree/v5.2.1) (2021-06-17)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v5.2.0...v5.2.1)

### Fixed

- Make source archive resource name generic [\#28](https://github.com/treydock/puppet-module-singularity/pull/28) ([treydock](https://github.com/treydock))

## [v5.2.0](https://github.com/treydock/puppet-module-singularity/tree/v5.2.0) (2021-06-17)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v5.1.0...v5.2.0)

### Added

- Support Singularity 3.8.0, update default version to 3.7.4 [\#27](https://github.com/treydock/puppet-module-singularity/pull/27) ([treydock](https://github.com/treydock))

## [v5.1.0](https://github.com/treydock/puppet-module-singularity/tree/v5.1.0) (2021-06-14)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v5.0.0...v5.1.0)

### Added

- Improve source install method to support better upgrade/downgrade [\#26](https://github.com/treydock/puppet-module-singularity/pull/26) ([treydock](https://github.com/treydock))
- Support Singularity plugin compile and install [\#25](https://github.com/treydock/puppet-module-singularity/pull/25) ([treydock](https://github.com/treydock))
- Update module dependency ranges [\#24](https://github.com/treydock/puppet-module-singularity/pull/24) ([treydock](https://github.com/treydock))

## [v5.0.0](https://github.com/treydock/puppet-module-singularity/tree/v5.0.0) (2021-03-19)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v4.0.0...v5.0.0)

### Changed

- Drop Puppet 5, add Puppet 7, drop EL6, update dependencies [\#22](https://github.com/treydock/puppet-module-singularity/pull/22) ([treydock](https://github.com/treydock))

### Added

- Support build from source and Debian and Ubuntu [\#23](https://github.com/treydock/puppet-module-singularity/pull/23) ([treydock](https://github.com/treydock))

## [v4.0.0](https://github.com/treydock/puppet-module-singularity/tree/v4.0.0) (2020-10-28)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v3.5.0...v4.0.0)

### Changed

- BREAKING: Support Singularity 3.6 [\#20](https://github.com/treydock/puppet-module-singularity/pull/20) ([treydock](https://github.com/treydock))

## [v3.5.0](https://github.com/treydock/puppet-module-singularity/tree/v3.5.0) (2019-12-18)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v3.4.0...v3.5.0)

### Added

- Add 'allow container encrypted' default [\#18](https://github.com/treydock/puppet-module-singularity/pull/18) ([treydock](https://github.com/treydock))

## [v3.4.0](https://github.com/treydock/puppet-module-singularity/tree/v3.4.0) (2019-11-14)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v3.3.0...v3.4.0)

### Added

- Add parameters to support Singularity 3.5.0 [\#17](https://github.com/treydock/puppet-module-singularity/pull/17) ([treydock](https://github.com/treydock))

## [v3.3.0](https://github.com/treydock/puppet-module-singularity/tree/v3.3.0) (2019-10-11)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v3.2.0...v3.3.0)

### Added

- Support EL8 [\#16](https://github.com/treydock/puppet-module-singularity/pull/16) ([treydock](https://github.com/treydock))

## [v3.2.0](https://github.com/treydock/puppet-module-singularity/tree/v3.2.0) (2019-10-10)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/v3.1.0...v3.2.0)

### Added

- Add support for managing /etc/subuid and /etc/subgid [\#15](https://github.com/treydock/puppet-module-singularity/pull/15) ([treydock](https://github.com/treydock))

## [v3.1.0](https://github.com/treydock/puppet-module-singularity/tree/v3.1.0) (2019-05-09)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/3.0.0...v3.1.0)

### Added

- Use Hiera v5 module data [\#14](https://github.com/treydock/puppet-module-singularity/pull/14) ([treydock](https://github.com/treydock))
- Use PDK [\#13](https://github.com/treydock/puppet-module-singularity/pull/13) ([treydock](https://github.com/treydock))

## [3.0.0](https://github.com/treydock/puppet-module-singularity/tree/3.0.0) (2019-03-20)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/2.0.1...3.0.0)

### Added

- README updates and use puppet strings for docs [\#12](https://github.com/treydock/puppet-module-singularity/pull/12) ([treydock](https://github.com/treydock))
- BREAKING: Update singularity.conf to support Singularity 3.1.0 [\#11](https://github.com/treydock/puppet-module-singularity/pull/11) ([treydock](https://github.com/treydock))

## [2.0.1](https://github.com/treydock/puppet-module-singularity/tree/2.0.1) (2018-10-16)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/2.0.0...2.0.1)

### Fixed

- Make underlay default match documented default [\#10](https://github.com/treydock/puppet-module-singularity/pull/10) ([treydock](https://github.com/treydock))

## [2.0.0](https://github.com/treydock/puppet-module-singularity/tree/2.0.0) (2018-10-15)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.2.0...2.0.0)

### Added

- Add support for Puppet 6 and drop support for Puppet 4 [\#9](https://github.com/treydock/puppet-module-singularity/pull/9) ([treydock](https://github.com/treydock))
- Update singularity.conf to match 3.0.0 [\#8](https://github.com/treydock/puppet-module-singularity/pull/8) ([treydock](https://github.com/treydock))

## [1.2.0](https://github.com/treydock/puppet-module-singularity/tree/1.2.0) (2018-09-14)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.1.0...1.2.0)

### Added

- Use beaker 4.x [\#7](https://github.com/treydock/puppet-module-singularity/pull/7) ([treydock](https://github.com/treydock))
- Support new options of Singularity-2.6.0 [\#6](https://github.com/treydock/puppet-module-singularity/pull/6) ([mrolli](https://github.com/mrolli))

## [1.1.0](https://github.com/treydock/puppet-module-singularity/tree/1.1.0) (2018-05-01)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.0.1...1.1.0)

### Added

- Add limit\_container\_groups parameter which was added in Singularity 2.5.0 [\#5](https://github.com/treydock/puppet-module-singularity/pull/5) ([treydock](https://github.com/treydock))

## [1.0.1](https://github.com/treydock/puppet-module-singularity/tree/1.0.1) (2018-05-01)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/1.0.0...1.0.1)

### Fixed

- Fixed boolean error when using provided hiera parameters [\#4](https://github.com/treydock/puppet-module-singularity/pull/4) ([kreczko](https://github.com/kreczko))

## [1.0.0](https://github.com/treydock/puppet-module-singularity/tree/1.0.0) (2018-03-19)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.1.0...1.0.0)

### Added

- BREAKING: Drop Puppet 3 support [\#3](https://github.com/treydock/puppet-module-singularity/pull/3) ([treydock](https://github.com/treydock))
- BREAKING: Change default for enable\_overlay to 'try' [\#2](https://github.com/treydock/puppet-module-singularity/pull/2) ([treydock](https://github.com/treydock))

## [0.1.0](https://github.com/treydock/puppet-module-singularity/tree/0.1.0) (2017-10-12)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.0.2...0.1.0)

### Added

- Add support for Singularity 2.4 [\#1](https://github.com/treydock/puppet-module-singularity/pull/1) ([treydock](https://github.com/treydock))

## [0.0.2](https://github.com/treydock/puppet-module-singularity/tree/0.0.2) (2017-08-15)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/0.0.1...0.0.2)

## [0.0.1](https://github.com/treydock/puppet-module-singularity/tree/0.0.1) (2017-08-07)

[Full Changelog](https://github.com/treydock/puppet-module-singularity/compare/6e32a24ae2186276248d1eaaf34cafc7f567c2f3...0.0.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
