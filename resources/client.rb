# frozen_string_literal: true

provides :npm_lazy_client
unified_mode true

property :registry_uri, String, default: 'http://localhost:8080'
property :install_nodejs, [true, false], default: false
property :node_packages, Array, default: %w(nodejs npm)

default_action :configure

action :configure do
  package new_resource.node_packages do
    action :install
    only_if { new_resource.install_nodejs }
  end

  execute 'set npm registry' do
    command "npm config set registry #{shellescape(new_resource.registry_uri)} --global"
    not_if registry_configured_guard
  end
end

action :remove do
  execute 'remove npm registry' do
    command 'npm config delete registry --global'
    only_if registry_configured_guard
  end
end

action_class do
  def shellescape(value)
    require 'shellwords'

    Shellwords.escape(value.to_s)
  end

  def registry_configured_guard
    pattern = Regexp.escape(new_resource.registry_uri.delete_suffix('/'))

    "npm config get registry --global | grep -E '^#{pattern}/?$'"
  end
end
