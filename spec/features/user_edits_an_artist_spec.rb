require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see the page for the individual artist" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)

    click_on 'Edit'
    fill_in "artist_name", with: 'Billy Bob'

    click_on 'Update Artist'

    expect(page).to have_content "Billy Bob"
  end

end
