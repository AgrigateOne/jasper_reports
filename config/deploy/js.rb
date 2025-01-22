# frozen_string_literal: true

server '10.0.0.4', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'