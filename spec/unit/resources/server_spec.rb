# frozen_string_literal: true

require 'spec_helper'

describe 'npm_lazy_server' do
  step_into :npm_lazy_server

  platform 'ubuntu', '24.04'

  before do
    stub_command('npm list --global --depth=0 npm_lazy').and_return(false)
  end

  recipe do
    npm_lazy_server 'default' do
      host '0.0.0.0'
      external_url 'http://npm-cache.example.com:8080'
    end
  end

  it 'installs node packages' do
    expect(chef_run).to install_package(%w(nodejs npm))
  end

  it 'creates the cache directory' do
    expect(chef_run).to create_directory('/srv/npm_lazy/db').with(recursive: true)
  end

  it 'installs npm_lazy from npm' do
    expect(chef_run).to run_execute('install npm package npm_lazy').with(
      command: 'npm install --global npm_lazy'
    )
  end

  it 'writes the npm_lazy config' do
    expect(chef_run).to create_template('/etc/npm_lazy-config.js').with(
      cookbook: 'npm_lazy',
      source: 'npm_lazy-config.js.erb'
    )
  end

  it 'creates a systemd unit' do
    expect(chef_run).to create_systemd_unit('npm_lazy.service')
  end

  it 'enables and starts the service' do
    expect(chef_run).to enable_service('npm_lazy')
    expect(chef_run).to start_service('npm_lazy')
  end
end
