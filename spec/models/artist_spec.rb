require 'rails_helper'

RSpec.describe Artist, type: :model do

    describe 'Artist' do
     let(:attributes) {{
         name: "Lady Gaga",
     }}

     it 'inherits from ActiveRecord::Base' do
       expect(Artist.superclass).to eq(ActiveRecord::Base)
     end

   end

     context 'Artist.new' do
       let(:artist) { Artist.new }
       it 'has a name' do
         artist.name = "Nas"
         expect(artist.name).to eq("Nas")
       end

       it 'has followers' do
         artist.followers = 1000
         expect(artist.followers).to be_an(Integer)
       end

       it 'has a url' do
         artist.url = "https://play.spotify.com/artist/4PpmBoqphQusNFsxuVKb6j?play=true&utm_source=open.spotify.com&utm_medium=open"
         expect(artist.url).to include("spotify.com/artist")
       end

     end
end
