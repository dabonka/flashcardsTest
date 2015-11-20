# RSpec.configure do |config|
  # config.include FactoryGirl::Syntax::Methods
# end

FactoryGirl.define do
  factory :card do
    original_text "Word"
    translated_text "Slovo"
    #  review_date Date.current
    #  id 1000
  end
end