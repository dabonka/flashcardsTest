require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

describe  "Cards", :type => :feature do
  it  "Input new card" do
    visit new_card_path
    fill_in 'card_original_text', :with => 'Windows'
    fill_in 'card_translated_text', :with => 'Okna'
    click_button 'Create Card'
    expect(page).to have_content 'Original Text'
  end

  
  it  "check_translation" do
    visit '/'
    fill_in 'user_variant', :with => :card_translated_text
    click_button 'Проверить!'
    expect(page).to have_content 'Флэшкарточкер'
  end
end
