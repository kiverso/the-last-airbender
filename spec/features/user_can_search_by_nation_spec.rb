require 'rails_helper'

RSpec.describe 'User can search characters by nation' do
  it "Returns characters belonging to the nation" do
    visit '/'

    select 'Fire Nation', from: :nation

    click_on('Search For Members')
    expect(current_path).to eq(search_path)
    expect(page).to have_content('61 results')
    expect(page).to have_css('.nation-member', count: 61)

    within(first('.nation-member')) do
      expect(page).to have_content('Chan')
      expect(page).to have_content('Affiliations: Fire Nation Navy')
      expect(page).to have_content('Allies: Ozai')
      expect(page).to have_content('Enemies: Earth Kingdom')
    end
  end
end