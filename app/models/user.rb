class User < ApplicationRecord
	has_many :attendances
	has_many :concerts, through: :attendances
end
