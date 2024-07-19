class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :company

  after_create :enqueue_welcome_email_job

  private

  def enqueue_welcome_email_job
    ManageJob.enqueue(WelcomeEmailJob, self.id) 
  end
end
