# frozen_string_literal: true
# Unifrutti Blydepakkers

server '172.20.0.250', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
