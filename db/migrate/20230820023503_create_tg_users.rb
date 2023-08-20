class CreateTgUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :tg_users do |t|
      t.integer :chat_id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.boolean :is_bot
      t.string :language_code
      t.string :is_premium
      t.string :added_to_attachment_menu
      t.boolean :can_join_groups
      t.boolean :can_read_all_group_messages
      t.boolean :supports_inline_queries

      t.timestamps
    end
  end
end
