# npm_lazy_server

Installs and manages an npm_lazy cache service.

## Actions

* `:install` - Installs npm_lazy, writes configuration, and starts the service.
* `:remove` - Stops npm_lazy and removes service, config, cache, and package.

## Properties

| Property              | Type        | Default                         | Description                              |
| --------------------- | ----------- | ------------------------------- | ---------------------------------------- |
| `package_name`        | String      | `npm_lazy`                      | npm package to install.                  |
| `install_nodejs`      | true, false | `true`                          | Install `nodejs` and `npm` packages.     |
| `node_packages`       | Array       | `%w(nodejs npm)`                | Runtime packages to install.             |
| `config_path`         | String      | `/etc/npm_lazy-config.js`       | Config file path.                        |
| `cache_directory`     | String      | `/srv/npm_lazy/db`              | Cache directory path.                    |
| `log_path`            | String      | `/var/log/npm_lazy.log`         | Log file path.                           |
| `cache_age`           | Integer     | `0`                             | Maximum metadata cache age.              |
| `http_timeout`        | Integer     | `5000`                          | HTTP timeout in milliseconds.            |
| `max_retries`         | Integer     | `5`                             | Retry count for remote requests.         |
| `reject_unauthorized` | true, false | `true`                          | Verify HTTPS requests.                   |
| `external_url`        | String      | `http://localhost:8080`         | External cache URL.                      |
| `remote_url`          | String      | `https://registry.npmjs.org/`   | Upstream npm registry URL.               |
| `port`                | Integer     | `8080`                          | Listener port.                           |
| `host`                | String      | `localhost`                     | Listener host.                           |
| `service_name`        | String      | `npm_lazy`                      | Service name.                            |
| `manage_service`      | true, false | `true`                          | Enable and start the service.            |

## Examples

```ruby
npm_lazy_server 'default' do
  host '0.0.0.0'
  external_url 'http://npm-cache.example.com:8080'
end
```
