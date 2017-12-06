class AddCommentedByToStudentComments < ActiveRecord::Migration[5.0]
  def change
    add_column :student_comments, :commented_by, :integer
  end
end
