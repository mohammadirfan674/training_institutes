class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :body
      t.string :language
      t.text :course_include
      t.string :requirement

      t.timestamps
    end
  end
end
