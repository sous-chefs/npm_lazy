# frozen_string_literal: true

describe package('nodejs') do
  it { should be_installed }
end

describe package('npm') do
  it { should be_installed }
end

describe file('/etc/npm_lazy-config.js') do
  it { should be_file }
  its('content') { should include("host: '0.0.0.0'") }
  its('content') { should include('port: 8080') }
end

describe directory('/srv/npm_lazy/db') do
  it { should exist }
end

describe systemd_service('npm_lazy') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe command('npm config get registry --global') do
  its('stdout') { should match(%r{http://localhost:8080/?}) }
end
