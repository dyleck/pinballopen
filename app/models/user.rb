class User < ActiveRecord::Base
  belongs_to :nationality
  has_and_belongs_to_many :roles

  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :nationality_id, inclusion: { in: Nationality.ids }
end
