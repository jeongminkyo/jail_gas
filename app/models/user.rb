class User < ApplicationRecord
  rolify
  include Authority::UserAbilities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :set_default_role
  # email이 없어도 가입이 되도록 설정

  def email_required?
    false
  end

  def is_admin?
    has_role?(:admin)
  end

  def is_user?
    has_role?(:user)
  end

  def is_member?
    has_role?(:member)
  end

  private

  def set_default_role
    add_role :user
  end

end
