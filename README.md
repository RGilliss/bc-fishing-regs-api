# B.C. Fishing Regulations API

This REST API was created to collect and serve fishing regulations in British Columbia to [The Net](https://github.com/brjl/the-net). These regulations are posted across a few different government websites and can be laborious to look up. The API serves up these regulations in an organized and systematic way, alongside geo co-ordinates you can plot on a map. Currently the API is limited to the Vancouver Island region, but in the future we'd like to expand to cover all of B.C. and Alberta, as well as Pacific Coast saltwater fisheries. 

## Getting Started

1. Fork and clone this repo
2. Run npm install to install the dependencies
3. Run the create.sql (located in db/schema) file in your Postgres DB
4. npm start the server which will run on Port 8000

