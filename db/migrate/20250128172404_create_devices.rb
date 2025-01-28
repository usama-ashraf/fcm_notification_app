class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :token
      t.string :platform

      t.timestamps
    end
  end
end
