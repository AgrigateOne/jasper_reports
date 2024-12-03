# frozen_string_literal: true

# VM instance at CFG
server '192.168.13.10', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
