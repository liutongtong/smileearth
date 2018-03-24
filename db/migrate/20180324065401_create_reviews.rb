class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :email
      t.string :fullname
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end