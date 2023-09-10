# frozen_string_literal: true

class User < ActiveRecord::Base
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :trackable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :events
  has_many :itens
  
  validates_uniqueness_of :email
end
