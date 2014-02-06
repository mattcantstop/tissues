class ChangeRequestCountToUsers < ActiveRecord::Migration
  def change
    change_column :users, :request_count, :integer, :default => 0
  end
end
