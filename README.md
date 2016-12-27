[![Build Status](https://travis-ci.org/akash93/ball-strike-api.svg?branch=master)](https://travis-ci.org/akash93/ball-strike-api)

Basic api connecting to [ BallStrike ]( https://github.com/akash93/ball-strike )

The api is currently deployed on heroku and can be accessed [here](https://ballstrike-api.herokuapp.com)

# Instructions

## For running the project locally

  * Clone the repo
  * Install gems using `bundle install --without production`
  * Run migrations using `rails db:migrate`
  * Run tests `bundle exec rspec` or `rspec`
  * Run the server `rails server`

## Accessing the api on heroku

  * Create a user by sending a **POST** request to `https://ballstrike-api.herokuapp.com/api/users` in with the following data:

    ```json
      {
        "user": {
          "email": "Enter some email",
          "password": "Enter password longer than 6 characters"
        }
      }
    ```

    The response will be the newly created user in the following format:

    ```json
      {
        "id": 4,
        "email": "akashkhan@gmail.com",
        "created_at": "2016-12-27T03:23:18.257Z",
        "updated_at": "2016-12-27T03:23:18.257Z",
        "auth_token": "8nVsMfsUuHZeb_4DtxWX",
        "current_level_id": 1
      }
    ```
  * Note the `auth_token` sent. This will be used for making further requests
  * Fetch the game level data by making a **GET** request to `https://ballstrike-api.herokuapp.com/api/gamelevels` with `Authorization` header value set to the `auth_token` received in the previous step
  * Update the `current_level_id` of the user by sending a **PATCH** request to `https://ballstrike-api.herokuapp.com/api/users/{user_id}`
