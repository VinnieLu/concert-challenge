class User < ApplicationRecord
	has_many :attendances
	has_many :concerts, through: :attendances

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :password, presence: true

end
