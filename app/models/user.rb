class User < ActiveRecord::Base
  belongs_to :nationality
  belongs_to :role

  validates :first_name, :last_name, presence: true
  validates :nationality_id, inclusion: Nationality.ids
  validates :role_id, inclusion: Role.ids
end
