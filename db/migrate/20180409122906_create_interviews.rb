class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.references 	:admin_id,  fereign_key: true
      t.string 		:title,		null: false
      t.text 		:body,		null: false

      t.timestamps
    end
  end
end
