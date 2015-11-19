# RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods
# end

FactoryGirl.define do
  factory :card do
    original_text "Word"
    translated_text "Slovo"
    review_date 20.days.ago
  end
end