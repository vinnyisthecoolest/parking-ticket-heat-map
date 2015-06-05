# Homepage (Root path)
get '/' do
  erb :index
end

get '/search' do
  if params[:street]
    search_term = "%#{params[:street].upcase}%"
    @array = Location.where("address LIKE ?", search_term)
  end
  erb :'/search/index'
end

get '/stats' do
  erb :'/stats/index'
end
