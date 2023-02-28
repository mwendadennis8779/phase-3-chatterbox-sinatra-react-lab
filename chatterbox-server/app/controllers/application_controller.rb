class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    message.to_json
  end

  patch '/messages/:id' do
    patch_message = Message.find(params[:id])
    patch_message.update(
      body: params[:body]
    )
    patch_message.to_json
  end


  delete '/messages/:id' do
    del_message = Message.find(params[:id])
    del_message.destroy
    del_message.to_json
  end
  
end
