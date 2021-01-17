class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :file
      t.references :user, foreign_key: true

      t.timestamps
    end
    # 検索することを見越して複合キーインデックスを設定
    add_index :posts, [:user_id, :created_at]
  end
end
