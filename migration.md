# Migration

## Custom Resource Migration

This cookbook no longer exposes root recipes or node attributes. The previous public API used
recipes such as `npm_lazy::server` and attributes under `node['npm_lazy']`. Use custom resources
and explicit properties instead.

## Server

Before:

```ruby
node.default['npm_lazy']['server']['config']['host'] = '0.0.0.0'
include_recipe 'npm_lazy::server'
```

After:

```ruby
npm_lazy_server 'default' do
  host '0.0.0.0'
end
```

## Client

Before:

```ruby
node.default['npm_lazy']['client']['registry_uri'] = 'http://npm-cache.example.com:8080'
include_recipe 'npm_lazy::client'
```

After:

```ruby
npm_lazy_client 'default' do
  registry_uri 'http://npm-cache.example.com:8080'
end
```
