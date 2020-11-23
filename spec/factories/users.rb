FactoryBot.define do
  factory :user do
    nickname              { 'aaa' }
    email                 { 'test@mail.com' }
    password              { 'aa3456' }
    password_confirmation { password }
    last_name             { '田中' }
    last_name_hurigana    { 'タナカ' }
    first_name            { '三郎' }
    first_name_hurigana   { 'サブロウ' }
    birthday { '1950-01-01' }
  end
end
