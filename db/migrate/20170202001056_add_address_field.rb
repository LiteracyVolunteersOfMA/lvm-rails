class AddAddressField < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :name
    # demographic
    add_column :students, :first_name,      :string
    add_column :students, :last_name,       :string
    add_column :students, :dob,             :date
    add_column :students, :gender,          :string
    add_column :students, :race             :string
    add_column :students, :is_hispanic      :boolean
    add_column :students, :origin_country   :string
    add_column :students, :native_language  :string
    # contact
    add_column :students, :address,         :string
    add_column :students, :city,            :string
    add_column :students, :state,           :string
    add_column :students, :zip,             :string
    add_column :students, :email,           :string
    add_column :students, :home_phone,      :string
    add_column :students, :cell_phone,      :string
    add_column :students, :work_number,     :string
    add_column :students, :alternate_number :string
    # emergency contact
    add_column :students, :emergency_name   :string
    add_column :students, :emergency_number :string
    # referral
    add_column :students, :referral         :string
    add_column :students, :why_lvm          :string
    # availability
    create_table :availability do |t|
      t.string :

      t.timestamps
    end

  end
end
