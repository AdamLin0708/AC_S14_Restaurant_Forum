class FixUsersColumnFromAvatorToAvatar < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :avator, :avatar
  end
end
