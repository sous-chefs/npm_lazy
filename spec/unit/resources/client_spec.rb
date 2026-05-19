# frozen_string_literal: true

require 'spec_helper'

describe 'npm_lazy_client' do
  step_into :npm_lazy_client

  platform 'ubuntu', '24.04'

  before do
    stub_command("npm config get registry --global | grep -E '^http://npm\\-cache\\.example\\.com:8080/?$'").and_return(false)
  end

  recipe do
    npm_lazy_client 'default' do
      registry_uri 'http://npm-cache.example.com:8080'
      install_nodejs true
    end
  end

  it 'installs node packages when requested' do
    expect(chef_run).to install_package(%w(nodejs npm))
  end

  it 'configures the npm registry' do
    expect(chef_run).to run_execute('set npm registry').with(
      command: 'npm config set registry http://npm-cache.example.com:8080 --global'
    )
  end
end
