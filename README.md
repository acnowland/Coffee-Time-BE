# README

# BACKEND FOR COFFEETIME
========================

# YOUR SOLUTION FOR MEETING COWORKERS....DIGITALLY


### Table of Content

* General Information
* Setup
* Code Examples
* Work in Progress


This is the current backend to my project called CoffeeTime. CoffeeTime was based on internal meeting services that are used throughout other large companies to facilitate meeting each other! The key factors for me was two-fold. Number 1) I had wanted to get a complete Auth up and running and Number 2) I want to have this deployed in the near future to allow my current school (Flatiron School) to be able to impliment it. This was an extremely fun project to work on and I think it has some nice areas for implementation in larger companies; especially during COVID. 


**_Technologies_**
* Ruby on Rails
* JWT
* B-crpyt
* Vanilla JS
* SweetAlert (plugin for alerts)

**_Setup_**
First, fork and clone this backend to make a local copy on your machine. If this is deployed I will add the heroku link here as well. You will want to double check to make sure CORS is allowing access for front end. You will also want to double check that the gems b-crypt and JWT are added and uncommented. After run a bundle install. Start the server with a 'rails s'. Something of note as well is that my current secret..well isnt very secret as I am pushing it out. I am leaving it as is so other people can see how the secret works. You will want to change that secret to the one provided in rails in the hidden folder that wont be pushed to git-hub! Also to note, with auth up and running, if you try to go to any of the endpoints using postman for example, you will get an error either telling you to login or to use a correct token. This can be accomplished by creating a user (easily done from front end) and then you can login, get a token, and view the whole database through postman.


**Code Examples**

Like I mentioned, my goal was to get Auth up and running well on this project to protect the safety of the users. Here are some examples of this below. These code blocks make sure that a user has to login prior to accessing any information on the website as well as be a legitamate user on the website!


```
class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: :login

    def login
        @user = User.find_by username: params[:username]

        if !@user
            render json: {error: 'Invalid username or password' }, status: :unauthorized
        else
            if !@user.authenticate params[:password]
                render json: {error: 'Invalid username or password'}, status: :unauthorized
            else

                payload = {user_id: @user.id}
                secret = '***'
                token = JWT.encode payload, secret

                render json:{
                    token: token, 
                    username: @user.username
                }
            end
        end
    end
end

```

```
class ApplicationController < ActionController::API
    before_action :authenticate
    
    def authenticate
        if !request.headers['Authorization']
            render json: {error: 'Use Bearer Auth'}, status: :forbidden
        else

            begin
                token = request.headers['Authorization'].split(' ')[1]
                secret = '***'
                decoded_token = JWT.decode token, secret
                payload = decoded_token.first
                user_id = payload['user_id']
                @user = User.find user_id  
            rescue
                render json: {error: 'Invalid Token'}, status: :forbidden
                
            end

        end
    end
end

```


**_Work in Progress_**

* My number one goal at the moment is to finish the update profile section to allow a user to change their mod number and time available. 
* Number 2 is getting this deployed on heroku! 


**_Created By_**

**Adam Nowland**