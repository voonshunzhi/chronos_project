# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
30.times do
  user['name'] = Faker::Ancient.god
  user['age'] = rand(20..50)
  user['ic'] = rand(1000000000..999999999999)
  user['gender']=["Male","Female"].sample
  user['email'] = Faker::Internet.email
  user['role'] = rand(0..1)

  User.create(user)
end
end

doctor = {}
dids = []
User.where(role:1).each { |d| dids<<d.id }

ActiveRecord::Base.transaction do
    dids.each do |d|
        doctor['code'] = Faker::Code.unique.nric #=> "S5589083H"
        doctor['user_id'] = d
      Doctor.create(doctor)
    end
end

dids=[]

Doctor.all.each {|d| dids << d.id}

patient = {}
pids = []


User.where(role:0).each { |pa| pids<<pa.id }

pids.each do |pa|
    patient = Patient.new
    ActiveRecord::Base.transaction do
        patient.weight = rand(30..80)
        patient.height = rand(140..180)
        patient.blood_type = ["Type A", "Type B", "Type O", "Type AB"].sample
        patient.user_id = pa
        patient.doctor_id = dids.sample
        patient.points = rand(0..100)
        patient.save
    end
end

pids = []
Patient.all.each {|pa| pids << pa.id}

healthrecord = {}
pids.each do |pa|
    ActiveRecord::Base.transaction do
        healthrecord['patient_id'] = pa
        HealthRecord.create(healthrecord)
    end
end

hrids = []
HealthRecord.all.each {|hr| hrids << hr.id }

obese = {}
ActiveRecord::Base.transaction do
pids.length.times do
    obese['bmi'] = rand(15..40)
    obese['waist_circumference'] = rand(30..50)
    obese['health_record_id'] = hrids.sample
    obese['weight'] = rand(30..80)
    obese['height'] = rand(140..180)
    obese['notes'] = Faker::HowIMetYourMother.quote
    Obese.create(obese)
end
end


hypertension = {}
ActiveRecord::Base.transaction do
pids.length.times do
    hypertension['SBP'] = rand(15..40)
    hypertension['DBP'] = rand(30..50)
    hypertension['medication'] = Faker::Food.dish #=> "Caesar Salad"
    hypertension['notes'] = Faker::HowIMetYourMother.quote
    hypertension['health_record_id'] = hrids.sample
    Hypertension.create(hypertension)
end
end


diabete = {}
ActiveRecord::Base.transaction do
pids.length.times do
    diabete['fasting_blood_glucose'] = rand(15..40)
    diabete['hg1ac'] = rand(30..50)
    diabete['meal'] = rand(30..50)
    diabete['blood_glucose_level'] = rand(30..50)
    diabete['medication'] = Faker::Food.dish #=> "Caesar Salad"
    diabete['notes'] = Faker::HowIMetYourMother.quote
    diabete['health_record_id'] = hrids.sample
    Diabete.create(diabete)
end
end

prize = {}
ActiveRecord::Base.transaction do
15.times do
    prize['name']=Faker::Food.dish  
    prize['description'] = Faker::HowIMetYourMother.quote
    prize['cost'] = rand(30..50)
    
    Prize.create(prize)
end
end