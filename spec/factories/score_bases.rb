FactoryBot.define do
  factory :score_basis, class: 'ScoreBase' do
    base_name { "MyString" }
    base_score { 1 }
    weight { 1.5 }
  end
end
