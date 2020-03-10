# frozen_string_literal: true

server '192.168.50.54', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
set :chruby_ruby, 'ruby-2.5.5'
# ONLY nspack dir
