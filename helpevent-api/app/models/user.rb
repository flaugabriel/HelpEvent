# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :trackable#, :confirmable
  include DeviseTokenAuth::Concerns::User
end
