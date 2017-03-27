class RefactorExamToAssessmentInTutor < ActiveRecord::Migration[5.0]
  def change
    remove_index :tutors, :exam_id
    add_index :tutors, :assessment_id
    rename_column :tutors, :exam_id, :assessment_id
  end
end
