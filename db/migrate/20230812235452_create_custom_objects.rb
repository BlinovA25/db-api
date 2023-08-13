class CreateCustomObjects < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_objects do |t|
      t.jsonb :data, null: false, default: {}
      t.integer :owner

      t.timestamps
    end
  end
end
