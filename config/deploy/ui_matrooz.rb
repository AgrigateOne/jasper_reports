# frozen_string_literal: true

server '172.18.0.20', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
