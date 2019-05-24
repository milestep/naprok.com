class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
    	t.string :name, index: true
      	t.string :position

      t.timestamps
    end
  end
end
