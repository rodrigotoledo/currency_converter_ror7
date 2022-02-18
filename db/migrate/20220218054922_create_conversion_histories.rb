class CreateConversionHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :conversion_histories do |t|
      t.string :from
      t.string :to
      t.float :amount
      t.float :result

      t.timestamps
    end
  end
end
