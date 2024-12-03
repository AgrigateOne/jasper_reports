# frozen_string_literal: true

# Patrysberg
server '192.168.15.5', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
