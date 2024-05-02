class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer "actor_id"
      t.integer "movie_id"
      t.string "character"

      t.timestamps
    end
  end
end
