# frozen_string_literal: true

# NoSoft QA on AWS EC2
server '13.247.65.162', user: 'onepack', roles: %w[app db web], web: { port: 6622 }
set :deploy_to, '/home/onepack/jasper_reports'
set :ssh_options, { keys: [File.expand_path('~') << '/.ssh/onepack_QA.pem'] }
