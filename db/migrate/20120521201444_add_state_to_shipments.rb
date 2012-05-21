class AddStateToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :state, :string
  end
end
