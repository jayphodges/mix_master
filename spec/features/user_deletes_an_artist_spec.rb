require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario 'User redirected to index without artist present' do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)

    visit artist_path(artist)

    click_on "Delete"
    expect(page).to have_content "Artist Index"
    expect(page).not_to have_content artist_name
    expect(page).not_to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
