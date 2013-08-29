class User < ActiveRecord::Base
  has_many :games
  has_many :levels, :through=> :games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable




end
