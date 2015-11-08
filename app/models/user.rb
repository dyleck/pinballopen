class User < ActiveRecord::Base
  has_secure_password

  belongs_to :nationality
  has_and_belongs_to_many :roles
  has_many :scores
  has_many :matches, through: :scores

  validates :first_name, :last_name, :email, :password_digest, presence: true
  # validates :first_name, uniqueness: { scope: :last_name }
  validates :nationality_id, inclusion: { in: Nationality.ids }
  validate :check_name_uniqueness

  def self.get_player_count
    player = Role.find_by_name('Player')
    self.all.map { |user| user.roles.index(player) }.compact.length
  end

  def get_player_full_name
    self.first_name + " " + self.last_name
  end

  private

    def check_name_uniqueness
      if not User.find_by(first_name: first_name, last_name: last_name).nil?
        errors.add :first_name, 'Player with this name already exists'
        errors.add :last_name, 'Player with this name already exists'
      end
    end

end
