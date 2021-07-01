class Filme < ApplicationRecord

	def salvar_novos(id_filme, original_title, overview, poster_path, release_date)
		filme = Filme.new
		filme.id_filme = id_filme
		filme.original_title = original_title
		filme.overview = overview
		filme.poster_path = "https://image.tmdb.org/t/p/w500" + poster_path if filme['poster_path'].present?
		filme.release_date = release_date
		filme.save
	end

	def existe_no_banco?(id_filme)
			filme = Filme.find_by(id_filme: id_filme)
			if filme.present?
			 	return true
			else
				return false
			end 
	end
end
