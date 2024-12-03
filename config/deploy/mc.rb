# frozen_string_literal: true

# Mouton Citrus
server '192.168.200.2', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
