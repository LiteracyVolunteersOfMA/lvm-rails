class AddCommentedByToTutorComments < ActiveRecord::Migration[5.0]
  def change
    add_column :tutor_comments, :commented_by, :integer
  end
end
