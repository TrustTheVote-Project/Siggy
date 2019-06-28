class Leo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable#, :rememberable

  def name
    "Jane Bloom"
  end
end
