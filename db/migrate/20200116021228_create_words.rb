class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :content
      t.string :meaning
      t.references :wordlist, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
