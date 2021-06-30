class AddCloumnsFilmes < ActiveRecord::Migration[6.1]
  def change
      add_column :filmes, :id_filme, :integer
      add_column :filmes, :original_title, :string
      add_column :filmes, :overview, :text
      add_column :filmes, :poster_path, :string
      add_column :filmes, :release_date, :string
  end
end
