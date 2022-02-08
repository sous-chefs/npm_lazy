# npm_lazy Cookbook CHANGELOG

This file is used to list changes made in each version of the npm_lazy cookbook.

## 2.0.4 - *2022-02-08*

- Remove delivery folder

## 2.0.3 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management

## 2.0.1 (2020-05-05)

- Migrate to actions

## v2.0.0 (2019-02-19)

- This cookbook has been transferred to the Sous Chefs. For more information or to become involved in maintaining this cookbook see [sous-chefs.org](https://sous-chefs.org/)
- Updated to support systemd based Debian distros (Ubuntu 16.04/Debian 8/Debian 9)
- Added InSpec integration tests
- Removed test dependency installation via Gemfile and converted testing to use Delivery local mode via ChefDK
- Added kitchen-dokken based integration testing in Travis CI
- Depend on nodejs cookbook 3.0 or later
- Require Chef 12.11 or later due to the use of the systemd_unit Chef resource

## v1.0.3

- Update requirements in the readme
- Add travis CI testing with Kitchen-docker
- Add requirements to the readme and include travis / supermarket badges
- Update testing deps in the Gemfile
- Added supermarket metadata
- Updated ignore files
- Use standard chef .rubocop.yml file and resolve all warnings
- Remove the Thorfile
- Add a changelog

## v1.0.2

- Make the client recipe update the registry for all users and not just the user that chef-client runs as (root generally)

## v1.0.1

- Change order of resources in server recipe to fix converges
- Add option to install / not install nodejs in the client recipe
- Add Test Kitchen config

## 1.0.0

- Initial release
