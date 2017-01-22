class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.belongs_to :student, index: true
      t.belongs_to :tutor, index: true

      t.timestamps
    end
  end
end
