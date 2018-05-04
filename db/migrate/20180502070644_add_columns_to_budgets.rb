class AddColumnsToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_column :budgets, :budget_from, :string
    add_column :budgets, :budget_to, :string
  end
end
