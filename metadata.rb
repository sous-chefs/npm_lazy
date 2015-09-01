name             'npm_lazy'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache 2.0'
description      'Installs and configures the npm_lazy application for caching NPM registry calls'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.2'

depends 'nodejs', '>= 2.0'

source_url 'https://github.com/tas50/chef-npm_lazy' if respond_to?(:source_url)
issues_url 'https://github.com/tas50/chef-npm_lazy/issues' if respond_to?(:issues_url)
