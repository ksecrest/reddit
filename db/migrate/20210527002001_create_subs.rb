class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :title

      t.timestamps
    end
  end
end
