# npm_lazy Cookbook CHANGELOG
This file is used to list changes made in each version of the npm_lazy cookbook.

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