class Chef < ApplicationRecord
	before_save {self.email = email.downcase}
	validates :chefname, presence: true, length: {maximum: 30}
	VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, 
	                  format: {with: VALID_EMAIL_REGX},
	                  uniqueness: {case_sensitive: false}

	has_many :recipes, dependent: :destroy
	has_secure_password
	validates :password, presence: true, length: {minimum: 8}, allow_nil: true

end