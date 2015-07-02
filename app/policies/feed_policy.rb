class FeedPolicy < ApplicationPolicy

  def index?
    user.present?
  end
end