FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '田中' }
    last_name_hurigana    { 'タナカ' }
    first_name            { '三郎' }
    first_name_hurigana   { 'サブロウ' }
    birthday { '1950-01-01' }
  end
end
