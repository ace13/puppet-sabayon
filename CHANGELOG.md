## 2016-10-16 Release 0.3.0

- Add `entropy_repo` type to enable/disable repositories
- Add `entropy_repos` fact

## 2016-10-13 Release 0.2.0

- Add `locale` fact
- Remove obsolete `has_entropy` fact
- Improve `entropy` package provider to set locale envvar directly
  and not shell out to a distributed script to set locale.

## 2016-10-13 Release 0.1.2

- Improved package regexes for valdiation and parsing
  (now following the Gentoo EAPI6 PMS document to ensure correctness)
- Removed validation for required parameters in `entropy_*` types

## 2016-10-13 Release 0.1.0

- Added support for additional types:
  - `entropy_splitdebug`
  - `entropy_splitdebug_mask`
  - `entropy_keywords`
- Added spec tests for most types and providers

## 2016-10-10 Release 0.0.2

- First forge release

