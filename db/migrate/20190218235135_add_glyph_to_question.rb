class AddGlyphToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :glyph, :string
  end
end
