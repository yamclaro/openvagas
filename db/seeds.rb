require 'faker'

# Configurar o Faker para usar o idioma português
Faker::Config.locale = 'pt-BR'

# Usar transações para garantir consistência
ActiveRecord::Base.transaction do
  # Limpar dados existentes
  Applicant.delete_all
  Position.delete_all
  Career.delete_all
  Company.delete_all
  PositionType.delete_all
  User.delete_all

  # Criar uma única companhia
  user = User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  
  company_name = Faker::Company.name rescue "Empresa Padrão"
  company_url = Faker::Internet.url rescue "http://default-url.com"
  company = Company.create!(name: company_name, url: company_url, user_id: user.id)

  # Criar tipos de posições
  position_types = 10.times.map do
    position_type_name = Faker::Job.field rescue "Tipo de Posição Padrão"
    PositionType.create!(name: position_type_name)
  end

  # Criar 20 carreiras
  careers = 20.times.map do
    career_name = Faker::Job.field rescue "Carreira Padrão"
    career_description = Faker::Lorem.sentence rescue "Descrição Padrão"
    Career.create!(name: career_name, description: career_description)
  end

  # Criar 50 posições
  positions = 50.times.map do
    position_name = Faker::Job.title rescue "Título de Posição Padrão"
    city = Faker::Address.city rescue "Cidade Padrão"
    state = Faker::Address.state rescue "Estado Padrão"
    summary = Faker::Lorem.paragraph rescue "Resumo Padrão"
    Position.create!(
      name: position_name,
      city: city,
      state: state,
      sumary: summary,
      company_id: company.id,
      status: [true, false].sample,
      career_id: careers.sample.id,
      position_type_id: position_types.sample.id
    )
  end

  # Criar 100 usuários e aplicantes com e-mails únicos
  emails = []
  100.times do
    email = Faker::Internet.unique.email
    emails << email
    phone = Faker::PhoneNumber.phone_number rescue "1234567890"
    user = User.create!(email: email, password: 'password', password_confirmation: 'password')
    
    # Garantir que o nome do aplicante não falhe
    applicant_name ||= "Nome Padrão"
    
    Applicant.create!(
      name: applicant_name,
      email: user.email,
      phone: phone,
      user_id: user.id,
      position_id: positions.sample.id
    )
  end
end

puts "Dados inseridos com sucesso!"
