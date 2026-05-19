# frozen_string_literal: true

provides :npm_lazy_server
unified_mode true

property :package_name, String, default: 'npm_lazy'
property :install_nodejs, [true, false], default: true
property :node_packages, Array, default: %w(nodejs npm)
property :config_path, String, default: '/etc/npm_lazy-config.js'
property :cache_directory, String, default: '/srv/npm_lazy/db'
property :log_path, String, default: '/var/log/npm_lazy.log'
property :cache_age, Integer, default: 0
property :http_timeout, Integer, default: 5000
property :max_retries, Integer, default: 5
property :reject_unauthorized, [true, false], default: true
property :external_url, String, default: 'http://localhost:8080'
property :remote_url, String, default: 'https://registry.npmjs.org/'
property :port, Integer, default: 8080
property :host, String, default: 'localhost'
property :service_name, String, default: 'npm_lazy'
property :manage_service, [true, false], default: true

default_action :install

action :install do
  package new_resource.node_packages do
    action :install
    only_if { new_resource.install_nodejs }
  end

  directory new_resource.cache_directory do
    recursive true
    action :create
  end

  execute "install npm package #{new_resource.package_name}" do
    command "npm install --global #{shellescape(new_resource.package_name)}"
    not_if "npm list --global --depth=0 #{shellescape(new_resource.package_name)}"
  end

  template new_resource.config_path do
    cookbook 'npm_lazy'
    source 'npm_lazy-config.js.erb'
    variables(config: config_hash)
    notifies :restart, "service[#{new_resource.service_name}]" if new_resource.manage_service
  end

  systemd_unit "#{new_resource.service_name}.service" do
    content(Unit: {
              Description: 'NPM Lazy - A lazy local cache for NPM to make your local deploys faster',
              Documentation: 'https://github.com/mixu/npm_lazy',
              After: 'network.target',
            },
            Service: {
              Type: 'simple',
              Environment: 'HOME=/root',
              ExecStart: "/usr/bin/env #{new_resource.package_name} -c #{new_resource.config_path}",
              Restart: 'on-failure',
            },
            Install: {
              WantedBy: 'multi-user.target',
            })
    action :create
    notifies :restart, "service[#{new_resource.service_name}]", :immediately if new_resource.manage_service
  end

  service new_resource.service_name do
    supports status: true, restart: true
    action [:enable, :start]
    only_if { new_resource.manage_service }
  end
end

action :remove do
  service new_resource.service_name do
    supports status: true, restart: true
    action [:stop, :disable]
    only_if { new_resource.manage_service }
  end

  systemd_unit "#{new_resource.service_name}.service" do
    action :delete
  end

  file new_resource.config_path do
    action :delete
  end

  directory new_resource.cache_directory do
    recursive true
    action :delete
  end

  execute "remove npm package #{new_resource.package_name}" do
    command "npm uninstall --global #{shellescape(new_resource.package_name)}"
    only_if "npm list --global --depth=0 #{shellescape(new_resource.package_name)}"
  end
end

action_class do
  def shellescape(value)
    require 'shellwords'

    Shellwords.escape(value.to_s)
  end

  def config_hash
    {
      cache_directory: new_resource.cache_directory,
      log_path: new_resource.log_path,
      cache_age: new_resource.cache_age,
      http_timeout: new_resource.http_timeout,
      max_retries: new_resource.max_retries,
      reject_unauthorized: new_resource.reject_unauthorized,
      external_url: new_resource.external_url,
      remote_url: new_resource.remote_url,
      port: new_resource.port,
      host: new_resource.host,
    }
  end
end
