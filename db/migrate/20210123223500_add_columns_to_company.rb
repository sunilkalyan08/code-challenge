class AddColumnsToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :city, :string
    add_column :companies, :state_code, :string
    add_column :companies, :color, :string, default: '#bb00ff'
  end
end
