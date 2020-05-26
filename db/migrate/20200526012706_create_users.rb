class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :joined_date
      t.timestamps
    end
  end
end
