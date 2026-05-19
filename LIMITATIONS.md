# Limitations

## Package Availability

`npm_lazy` is distributed as an npm package rather than a native operating system package.
This cookbook installs the runtime with native `nodejs` and `npm` packages and then installs
the `npm_lazy` npm package globally with npm.

### APT (Debian/Ubuntu)

* Debian 12 and 13: supported through the distribution `nodejs` and `npm` packages.
* Ubuntu 22.04 and 24.04: supported through the distribution `nodejs` and `npm` packages.

### DNF/YUM (RHEL family)

* Not supported by this cookbook. Existing metadata only declared Debian and Ubuntu support.

### Zypper (SUSE)

* Not supported by this cookbook. Existing metadata only declared Debian and Ubuntu support.

## Architecture Limitations

The cookbook does not enforce architecture restrictions. Platform package availability for
`nodejs` and `npm` determines architecture support.

## Source/Compiled Installation

The cookbook does not build `npm_lazy` from source.

## Known Issues

* Root `recipes/` and `attributes/` were removed in the custom resource migration. Use
  `npm_lazy_server` and `npm_lazy_client` resources instead.
* The legacy Upstart unit was removed. Current supported platforms use systemd.
