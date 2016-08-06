class AddVerifiedEmailAndTokenUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :verified_email, :boolean, null: false, default: false
    add_column :users, :token, :string, default: ''

  end
end
