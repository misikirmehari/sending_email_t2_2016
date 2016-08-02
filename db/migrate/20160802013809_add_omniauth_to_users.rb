class AddOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :omniauth, :boolean
  end
end
