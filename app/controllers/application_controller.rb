# require "pry"
class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
    get '/' do
        en = List.all
        en.to_json(include: {tasks: {only: [:id,:name]}})
    end

    get "/tasks" do
        ny = Task.all
        ny.to_json
    end  
     get "/list/:id" do
        di = List.find(params[:id])
        di.to_json
     end  
     delete "/list/:id" do
        dele = List.find(params[:id])
        dele.destroy
        dele.to_json
     end   
     patch "/tasks/:id" do
        edi = Task.find(params[:id])
        edi.update(name: params[:name], user_id: params[:user_id], list_id: params[:list_id])
        edi.to_json
     end  
        
    get "/users" do
        us = User.all
        us.to_json
    end  
    delete "/tasks/:id" do
        del = Task.find(params[:id])
        del.destroy
        del.to_json
    end 
    
    post "/tasks" do
        newTask = Task.create(name: params[:name], user_id: params[:user_id], list_id: params[:list_id])
        newTask.to_json
        # binding.pry
    end 
    # post "/list" do
    #     newTask = List.create(name: params[:name], user_id: params[:user_id], list_id: params[:list_id])
    #     newTask.to_json
    #     # binding.pry
    # end  

end  

