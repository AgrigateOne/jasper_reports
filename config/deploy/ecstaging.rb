# frozen_string_literal: true

# NoSoft Staging on AWC EC2
server '13.244.99.177', user: 'ubuntu', roles: %w[app db web], web: { port: 6622 }
set :deploy_to, '/home/ubuntu/jasper_reports'
set :ssh_options, { keys: [File.expand_path('~') << '/.ssh/nspack_ec2.pem'] }
set :chruby_ruby, 'ruby-3.1.2'
