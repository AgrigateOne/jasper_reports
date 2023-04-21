# frozen_string_literal: true

# Denau
server '192.168.10.5', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
set :chruby_ruby, 'ruby-3.1.2'
