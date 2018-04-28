class CreateStudentAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :student_answers do |t|
      t.references :student_detail, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
