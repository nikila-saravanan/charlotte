class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_artists
  has_many :artists, through: :user_artists
  has_many :artist_genres
  has_many :genres, through: :artist_genres
end
