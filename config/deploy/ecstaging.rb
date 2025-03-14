# frozen_string_literal: true

# NoSoft Staging on AWC EC2
server '13.247.165.236', user: 'ubuntu', roles: %w[app db web], web: { port: 6622 }
set :deploy_to, '/home/ubuntu/jasper_reports'
set :ssh_options, { keys: [File.expand_path('~') << '/.ssh/nspack_ec2.pem'] }
