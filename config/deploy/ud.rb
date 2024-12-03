# frozen_string_literal: true

server '172.17.0.243', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
