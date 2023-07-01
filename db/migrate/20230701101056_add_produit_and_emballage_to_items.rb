class AddProduitAndEmballageToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :produit, :boolean
    add_column :items, :emballage, :boolean
  end
end

