class RefactorExamToAssessmentInStudent < ActiveRecord::Migration[5.0]
  def change
    rename_column :students, :exam_id, :assessment_id
    remove_index :students, :exam_id
    add_index :students, :assessment_id
  end
end
