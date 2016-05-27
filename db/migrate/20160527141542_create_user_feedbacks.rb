class CreateUserFeedbacks < ActiveRecord::Migration
  def change
    create_table :user_feedbacks do |t|
      t.string :mobile_number
      t.string :current_brand
      t.string :current_variant
      t.string :other_brand
      t.string :other_variant
      t.integer :no_of_sticks
      t.string :reason_cb
      t.string :reason_cv
      t.string :reason_ob
      t.string :reason_ov
      t.string :reason_sticks

      t.timestamps null: false
    end
  end
end
