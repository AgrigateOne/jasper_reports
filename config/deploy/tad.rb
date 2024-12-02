# frozen_string_literal: true

# VM instance at TAD
server '172.18.0.111', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
set :chruby_ruby, 'ruby-3.3.5'
