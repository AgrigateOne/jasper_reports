# frozen_string_literal: true

# NSpack server at Kromco.
server '172.16.16.22', user: 'nsld', roles: %w[app db web]
set :deploy_to, '/home/nsld/jasper_reports'
