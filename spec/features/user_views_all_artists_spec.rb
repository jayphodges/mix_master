require 'rails_helper'

RSpec.feature "User visits the index" do
  scenario "they see the page for the individual artist" do
    Artist.create(name: "Bob Marley", image_path: 'http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg')
    Artist.create(name: "Bob Ross", image_path: 'http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146037.jpg')

    visit artists_path

    expect(page).to have_content "Bob Marley"
    expect(page).to have_content "Bob Ross"
  end

  scenario "they are able to click through the artist to the show view" do
    artist_name       = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: artist_name, image_path: artist_image_path)

    visit artists_path
    click_on artist_name

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
