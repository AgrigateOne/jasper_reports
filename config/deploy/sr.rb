# frozen_string_literal: true

# Sitrusrand
server '192.168.2.6', user: 'nspack', roles: %w[app db web]
# server '192.168.252.146', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
