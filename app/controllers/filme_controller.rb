class FilmeController < ApplicationController
	layout 'application'

	# Endpoint API - Buscar filme atravez de uma frase
	# https://api.themoviedb.org/3/search/movie?api_key=e2e6c0526e3737f2381684d2fd63d354&language=pt-BR&query=madagascar&page=1&include_adult=false

	# Base url img
	# https://image.tmdb.org/t/p/w500/<< poster_path >>	

	def index
			
	end

	def buscar_filme
	@dados = InterfaceApi::buscar(params[:nome])		
	respond_to do |format|
		format.html{redirect_to '/'}
		format.js
	end 
	end

end
#@dados = RestClient.get(url)
#@dados = JSON.parse(@dados.body)["results"]