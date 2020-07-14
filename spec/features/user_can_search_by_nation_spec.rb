require 'rails_helper'

RSpec.describe 'User can search characters by nation' do
  it "Returns characters belonging to the nation" do
    visit '/'

    select 'Fire Nation', from: :nation

    click_on('Search For Members')
    expect(current_path).to eq(search_path)
    expect(page).to have_content('45 results')
    expect(page).to have_css('.nation-member', count: 45)

    within(first('.nation-member')) do
      expect(page).to have_content('Afiko')
      expect(page).to have_css("img[src*='https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128']")
      expect(page).to have_content('Affiliations: Fire Nation')
      expect(page).to have_content('Allies: Ozai')
      expect(page).to have_content('Enemies: Earth Kingdom')
    end
  end
end