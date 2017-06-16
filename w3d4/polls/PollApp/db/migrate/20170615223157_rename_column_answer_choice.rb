class RenameColumnAnswerChoice < ActiveRecord::Migration[5.0]
  def change
    rename_column :answer_choices, :answer_choices, :answer_choice
  end
end
