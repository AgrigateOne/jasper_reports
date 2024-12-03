# frozen_string_literal: true

server '192.168.9.50', user: 'habata', roles: %w[app db web]
set :deploy_to, '/home/habata/jasper_reports'
