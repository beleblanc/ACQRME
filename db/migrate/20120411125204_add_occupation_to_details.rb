class AddOccupationToDetails < ActiveRecord::Migration
  def change
    add_column :details, :occupation, :string , :limit => 50

    add_column :details, :company, :string, :limit => 50

    add_column :details, :company_url, :string, :limit => 50

  end
end
