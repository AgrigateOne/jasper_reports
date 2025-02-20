# frozen_string_literal: true

# NSpack server at Kromco.
server '172.16.16.22', user: 'onepack', roles: %w[app db web]
set :deploy_to, '/home/onepack/jasper_reports'
