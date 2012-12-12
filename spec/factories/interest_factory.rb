FactoryGirl.define do
  factory :interest do
    user "jpivotal@pivotallabs.com"
    association :project, :factory => :project
  end
end