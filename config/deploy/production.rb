server '82.196.4.244', user: 'deployer', roles: ENV['MIGRATE'] ? %w{web app db} : %w{web app}
