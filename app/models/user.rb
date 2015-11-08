class User < ActiveRecord::Base
  has_secure_password
  before_validation :capitalize_names

  belongs_to :nationality
  has_and_belongs_to_many :roles
  has_many :scores
  has_many :matches, through: :scores

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :nationality_id, inclusion: { in: Nationality.ids }
  validates :email, format: { with: /\A[a-zA-Z0-9\.\+_]+@[a-zA-Z0-9_]+\.[a-zA-Z]+/}
  validates :email, uniqueness: { case_sensitive: false }
  validate :check_uniqueness_of_full_name

  def self.get_player_count
    player = Role.find_by_name('Player')
    self.all.map { |user| user.roles.index(player) }.compact.length
  end

  def get_player_full_name
    self.first_name + " " + self.last_name
  end

  private

    def check_uniqueness_of_full_name
      if not User.find_by(first_name: first_name, last_name: last_name).nil?
        errors.add :first_name, 'Player with this name already exists'
        errors.add :last_name, 'Player with this name already exists'
      end
    end

    def capitalize_names
      first_name.capitalize!
      last_name.capitalize!
    end

end
