# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :tasks, dependent: :destroy
  has_one :user_setting, dependent: :destroy

  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'Must be a valid email adress' }

  validates :password, presence: true, length: { minimum: 6 }
end
