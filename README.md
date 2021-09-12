# The Vending Machine
### Visit here: https://sleepy-springs-20376.herokuapp.com/
The Vending Machine is a website to order beverages. The deployed version on heroku can be found [here](https://sleepy-springs-20376.herokuapp.com/).

### Preview
![Screenshot from 2021-09-12 15-07-48](https://user-images.githubusercontent.com/33066689/132982724-a2c894bf-360b-49e3-b78c-219f36bc92eb.png)

### Installation

Find the below steps to setup the project locally:

* Install ruby version: 2.6.6 using [rvm](https://rvm.io/rvm/install)

* Install [postgresql](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart) and set the username and password as mentioned in the database.yml

* Clone the above repo and run bundle install

* Run `rails db:migrate`

* Run `rails db:seed`

* To start the server run `rails s`

* The Vending Machine should be up and running on `localhost:3000`

### Running tests
Tests are handled by rspecs. To run rspecs run the following command:
* `rspec ./spec`
