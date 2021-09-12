# The Vending Machine
### Visit here: https://sleepy-springs-20376.herokuapp.com/
The Vending Machine is a website to order beverages. The deployed version on heroku can be found [here](https://sleepy-springs-20376.herokuapp.com/).

### Installation

Find the below steps to setup the project locally:

* Install ruby version: 2.6.6 using [rvm](https://rvm.io/rvm/install)

* Install postgresql and set the username and password as mentioned in the database.yml

* Clone the above repo and run bundle install

* Run `rails db:migrate`

* Run `rails db:seed`

* To start the server run `rails s`

* The Vending Machine should be up and running on `localhost:3000`

### Running tests
Tests are handled by rspecs. To run rspecs run the following command:
* `rspec ./spec`
