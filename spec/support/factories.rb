FactoryGirl.define do
  factory :artist do
    sequence :name do |i|
      "Artist#{i}"
    end
    sequence :image_path do |i|
      "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI000314603#{i}.jpg"
    end
  end

  factory :song do
    sequence :title do |i|
      "Song#{i}"
    end
    artist
  end

end
