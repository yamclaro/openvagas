# app/services/manage_job.rb

class ManageJob
    # enfileirar
    def self.enqueue(job_class, *args)
      job_class.perform_later(*args)
    end
  
    # horário específico
    def self.schedule(job_class, at:, *args)
      job_class.set(wait_until: at).perform_later(*args)
    end
  
    # periodico
    def self.schedule_recurring(job_class, cron_expression:, *args)
      Sidekiq::Cron::Job.create(
        name: "#{job_class.name} - #{cron_expression}",
        cron: cron_expression,
        class: job_class.name,
        args: args
      )
    end
  end
  