class FilmeController < ApplicationController
	layout 'application'
	after_action :salva_historico, only: [:buscar_filme]

	def index
			
	end

	def buscar_filme
		@filmes = InterfaceApi::buscar_filmes(params[:nome])
		@series = InterfaceApi::buscar_series(params[:nome])
		@coletaneas = InterfaceApi::buscar_coletaneas(params[:nome])
		@pessoas = InterfaceApi::buscar_pessoas(params[:nome])
		@palavra_chave = InterfaceApi::buscar_palavra_chave(params[:nome])
		@produtoras = InterfaceApi::buscar_produtoras(params[:nome])

		@termo_busca = params[:nome]
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
		

		salvar_novos_resultados(@filmes)

		return @filmes, @series, @coletaneas, @pessoas, @palavra_chave, @produtoras, @termo_busca
	end

	def filtro_serie
		@series = InterfaceApi::buscar_series(params[:nome])
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end 
	end

	def filtro_filme
		@filmes = InterfaceApi::buscar_filmes(params[:nome])
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
	end

	def filtro_pessoa
		@pessoas = InterfaceApi::buscar_pessoas(params[:nome])
		respond_to do |format|
			format.html {redirect_to '/'}
			format.js
		end
	end

	def filtro_coletanea
		@coletaneas = InterfaceApi::buscar_coletaneas(params[:nome])
		respond_to do |format|
			format.html {redirect_to '/'}
			format.js
		end	
	end

	def filtro_palavras_chave
		@palavras_chave = InterfaceApi::buscar_palavra_chave(params[:nome])
		respond_to do |format|
			format.html {redirect_to '/'}
			format.js
		end
	end

	def filtro_produtoras
		@produtoras = InterfaceApi::buscar_produtoras(params[:nome])
		respond_to do |format|
			format.html {redirect_to '/'}
			format.js
		end
	end

	def detalhes_filme
		@filme = InterfaceApi::detalhes_item(params[:id], "movie")
	end

	def detalhes_serie
		@serie = InterfaceApi::detalhes_item(params[:id], "tv")
	end

	def detalhes_coletaneas
		@coletanea = InterfaceApi::detalhes_item(params[:id], "collection")
	end

	def filmes_locais
		@filmes = Filme.limit(20)
		respond_to do |format|
			format.html{redirect_to '/'}
			format.js
		end
	end

	def detalhes_filmes_locais
		@filme = Filme.find(params[:id])
	end

	def create
		@filme = Filme.new(permit_params)
		if @filme.save
			flash[:success] = "Salvo com sucesso"
		else
			flash[:fail] = "Ocorreu algum erro ao savar no banco de dados"
		end
		respond_to do |format|
			format.js
		end
	end

	def editar
		@filme = Filme.find(params[:id])
		if @filme.update(permit_params)
			flash[:success] = "Alteração realizada com sucesso ! ;)"
		else
			flash[:fail] = "Erro ao salvar as alterações no banco de dados :("
		end
		redirect_to "/detalhes/filmes_locais/#{params[:id]}"
	end

	def destroy
		filme = Filme.find(params[:id])
		if filme.destroy
			flash[:success] = "Filme Excluido com sucesso ! huhulll. Já são 03:00 hrs da manhã e eu estou aqui ainda !"
		else
			flash[:fail] = "Ops ! ocorreu algum erro al excluir :("
		end

		redirect_to filmes_locais_path
	end

	def mostrar_historico
		@historico = HistoricoBusca.all
	end

private

	def permit_params
		params.require(:filme).permit(:id_filme, :original_title, :overview, :release_date, :poster_path )
	end

	def salvar_novos_resultados(filmes)
		f = Filme.new
		filmes.each do |filme|
			unless f.existe_no_banco?(filme['id'])
				f.salvar_novos(filme['id'],
							   filme['original_title'],
							   filme['overview'],
							   filme['poster_path'],
							   filme['release_date'])
			end
		end
	end

	def salva_historico
		@historico = HistoricoBusca.new
		@historico.termo_pesquisa = params[:nome]
		@historico.save
	end
end