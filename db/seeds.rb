require 'faker'

Faker::Config.locale = 'pt-BR'

ActiveRecord::Base.transaction do

  Applicant.delete_all
  Position.delete_all
  Career.delete_all
  Company.delete_all
  PositionType.delete_all
  User.delete_all

  user = User.create!(email: 'admin@example.com', password: '102030', password_confirmation: '102030')
  
  company_name = "Desenvolvimeto"
  company_url = Faker::Internet.url
  company = Company.create!(name: company_name, url: company_url, user_id: user.id)

  position_types = 10.times.map do
    position_type_name = Faker::Job.field
    PositionType.create!(name: position_type_name)
  end

  careers = 20.times.map do
    career_name = Faker::Job.field
    career_description = Faker::Lorem.sentence
    Career.create!(name: career_name, description: career_description)
  end

  positions = 50.times.map do
    position_name = Faker::Job.title
    city = Faker::Address.city
    state = Faker::Address.state
    summary = Faker::Lorem.paragraph
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

  100.times do
    email = Faker::Internet.unique.email
    phone = Faker::PhoneNumber.phone_number
    user = User.create!(email: email, password: 'password', password_confirmation: 'password')
    
    applicant_name = Faker::Name.name
    
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
