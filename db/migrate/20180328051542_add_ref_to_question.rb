class AddRefToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :student_detail, foreign_key: true
  end
end
