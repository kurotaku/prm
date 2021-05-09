class UserProfileDecorator < ApplicationDecorator
  delegate_all

  def has_account
    object.account? ? '開設済み' : '未開設'
  end

end
