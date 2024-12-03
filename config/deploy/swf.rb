# frozen_string_literal: true

server '192.168.11.2', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
