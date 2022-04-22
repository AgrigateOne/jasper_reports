# frozen_string_literal: true

# VM instance at GHS
server '192.168.6.31', user: 'nsprint', roles: %w[app db web]
set :deploy_to, '/home/nsprint/jasper_reports'
set :chruby_ruby, 'ruby-2.5.8'
