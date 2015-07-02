class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end

  def standard?
    if current_user == !moderator? || current_user == !admin?
      role == 'standard'
    end
  end   

end
