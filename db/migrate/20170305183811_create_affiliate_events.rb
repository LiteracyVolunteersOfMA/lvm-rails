class CreateAffiliateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliate_events do |t|
      t.belongs_to :tutor

      t.string :title, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
