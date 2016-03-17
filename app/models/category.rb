class Category < ActiveRecord::Base

  def to_enable
    self.update_columns(status: true)
  end

  def to_disable
    self.update_columns(status: false)
  end
end
