# Golden Ridge
server '192.168.30.1', user: 'nosoft', roles: %w[app db web]
set :deploy_to, '/home/nosoft/jasper_reports'
set :chruby_ruby, 'ruby-3.1.2'
