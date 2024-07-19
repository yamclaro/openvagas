require 'sidekiq'
require 'sidekiq-cron'

# Configuração do Sidekiq para o servidor
Sidekiq.configure_server do |config|
  config.redis = {
    host: ENV['REDIS_HOST'] || 'localhost',
    port: ENV['REDIS_PORT'] || '6379'
  }

  # Adiciona o middleware do Sidekiq-Cron para suportar jobs cron
  config.server_middleware do |chain|
    chain.add Sidekiq::Cron::Middleware
  end

  # Carrega jobs cron definidos no arquivo YAML
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(Rails.root.join('config', 'sidekiq_cron.yml'))
end

# Configuração do Sidekiq para o cliente
Sidekiq.configure_client do |config|
  config.redis = {
    host: ENV['REDIS_HOST'] || 'localhost',
    port: ENV['REDIS_PORT'] || '6379'
  }
end
