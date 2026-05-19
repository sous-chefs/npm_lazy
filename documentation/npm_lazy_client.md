# npm_lazy_client

Configures npm to use an npm_lazy registry.

## Actions

| Action       | Description                                      |
| ------------ | ------------------------------------------------ |
| `:configure` | Sets the global npm registry to `registry_uri`.  |
| `:remove`    | Deletes the global npm registry setting.         |

## Properties

| Property         | Type        | Default                 | Description                          |
| ---------------- | ----------- | ----------------------- | ------------------------------------ |
| `registry_uri`   | String      | `http://localhost:8080` | npm registry URI to configure.       |
| `install_nodejs` | true, false | `false`                 | Install `nodejs` and `npm` packages. |
| `node_packages`  | Array       | `%w(nodejs npm)`        | Runtime packages to install.         |

## Examples

```ruby
npm_lazy_client 'default' do
  registry_uri 'http://npm-cache.example.com:8080'
end
```
