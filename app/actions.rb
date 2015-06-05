# Homepage (Root path)
get '/' do
  erb :index
end

get '/search' do
  erb :'/search/index'
end

post '/search' do
  search_term = "%#{params[:street].upcase}%"
  @array = Location.where("address LIKE ?", search_term)
  erb :'/search/index'
end

get '/stats' do
  erb :'/stats/index'
end
