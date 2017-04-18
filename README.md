### kronkite-server

kronkite-server is the backed for the kronkite-v2 app.

kronkite-server provided an opportunity to build a backend using a more "traditional" backend language--in this case Ruby.

Because important functionality had been discovered in a node module--functionality for which there was no comparable Ruby Gem and building from scratch would have been tedious and time-consuming--kronkite-server was also an opportunity to build a backend using a microservices architecture. 

In order to support tracking Google search trends, a node module that pulls the Google Trends RSS feed is used. 

Because the principal backend (the surface of the backend that touches the client) is written in Ruby, the node module is deployed as a completely independent service that the Ruby backend call via HTTP.

The Ruby backend parses the response from the node-based service and pass that response through to the client. 

The Ruby backend also pulls in responses from the YouTube and Spotify APIs. These responses are augmented and then encapsulated in a JSON response to the client. 

