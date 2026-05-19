# frozen_string_literal: true

npm_lazy_server 'default' do
  host '0.0.0.0'
  external_url 'http://localhost:8080'
end

npm_lazy_client 'default' do
  registry_uri 'http://localhost:8080'
end
