# frozen_string_literal: true

# Pack Materials DEVELOPMENT server at Kromco.
server '172.16.16.10', user: 'nsld', roles: %w[app db web]
set :deploy_to, '/home/nsld/jasper_reports'
