require 'rails_helper'

describe 'Group list' do
  it 'shows a list of all groups' do
    coffee_group = create(:group, name: 'Coffee')
    beer_group = create(:group, name: 'Beer')

    visit '/'
    expect(page).to have_link('Coffee', href: group_path(coffee_group))
    expect(page).to have_link('Beer', href: group_path(beer_group))
  end
end