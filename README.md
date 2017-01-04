[![Build Status](https://travis-ci.org/akash93/ball-strike-api.svg?branch=master)](https://travis-ci.org/akash93/ball-strike-api)

Basic api connecting to [ BallStrike ]( https://github.com/akash93/ball-strike )

The api is currently deployed on heroku and can be accessed [here](https://ballstrike-api.herokuapp.com)

# Instructions

## For running the project locally

  * Clone the repo
  * Install gems using `bundle install --without production`
  * Run migrations using `rails db:migrate`
  * Seed data using `rails db:seed`
  * Run tests `bundle exec rspec` or `rspec`
  * Run the server `rails server`

## Accessing the api on heroku

  * There is a test user available for testing the api. Use following credentials for testing the api as a test user.

    ```json
      {
        "email":"user@example.com",
        "password": "password"
      }

    ```
  * Create a user by sending a **POST** request to `https://ballstrike-api.herokuapp.com/api/users` in with the following data:

    ```json
      {
        "user": {
          "email": "Enter some email",
          "password": "Enter password longer than 6 characters"
        }
      }
    ```
    Using curl:

    `curl -H 'Content-Type:application/json,charset=utf-8' -X POST -d '{"user":{"email":"user@example.com", "password":"password"}}' https://ballstrike-api.herokuapp.com/api/users `

    The response will be the newly created user in the following format:

    ```json
      {
        "id": 4,
        "email": "akashkhan@gmail.com",
        "created_at": "2016-12-27T03:23:18.257Z",
        "updated_at": "2016-12-27T03:23:18.257Z",
        "current_level_id": 1
      }
    ```

  * Once you've already created a user before you can get the authentication token by making a POST request to
  `https://ballstrike-api.herokuapp.com/api/sessions` with the following post data

  ```json
    {
      "session":{
        "email":"Enter email",
        "password": "Enter password"
      }
    }
  ```
    Using curl:

    ```sh
    curl -H 'Content-Type:application/json' -X POST -d '{"session":{"email":"user@example.com", "password":"password"}}'
    ```
    
    The response will be the same user object as above except that it will contain an additional field `auth_token`

  * Note the `auth_token` received. This will be used for making further requests
  * Fetch the game level data by making a **GET** request to `https://ballstrike-api.herokuapp.com/api/gamelevels` with `Authorization` header value set to the `auth_token` received in the previous step

    ```sh
    curl -H 'Authorization:auth_token' https://ballstrike-api.herokuapp.com/api/gamelevels
    ```

  * Update the `current_level_id` of the user by sending a **PATCH/PUT** request to `https://ballstrike-api.herokuapp.com/api/users/{user_id}`
