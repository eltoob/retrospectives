class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :pivotal_tracker_api_key, :pivotal_tracker_project_id


  has_many :retros

  def can_submit_to_pivotal_tracker?
    pivotal_tracker_api_key.present? && pivotal_tracker_project_id.present?
  end
end
