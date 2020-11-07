FactoryBot.define do
  factory :user do
    transient do
      people{Gimei.name}
    end
    nickname {people.last.katakana}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
