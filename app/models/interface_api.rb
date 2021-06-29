class InterfaceApi < ApplicationRecord
	require 'json'
	require 'rest-client'
	
	BASE_URL_MOVIE = "https://api.themoviedb.org/3/search/movie?" 
	API_KEY = "api_key=e2e6c0526e3737f2381684d2fd63d354&"
	LANGUAGE = "language=pt-BR&"

	def self.buscar(query, page=1)
		url = self.construir_url(query, page)
		dados = RestClient.get(url)
		dados = JSON.parse(dados.body)["results"]
	end

	def self.construir_url(query, page=1)
	#	https://api.themoviedb.org/3/search/movie?api_key=e2e6c0526e3737f2381684d2fd63d354&language=pt-BR&query=madagascar&page=1&include_adult=false
		url = BASE_URL_MOVIE + API_KEY + LANGUAGE + "query=#{query}" + "&#{page}" '&include_adult=false'
	end

end
