class Game < ActiveRecord::Base
  has_many :levels
  belongs_to :user

  accepts_nested_attributes_for :levels
end
