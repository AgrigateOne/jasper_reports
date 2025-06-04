# frozen_string_literal: true

# Jasper at Karino
server '192.168.10.2', user: 'nspack', roles: %w[app db web]
set :deploy_to, '/home/nspack/jasper_reports'
