### kronkite-server

kronkite-server is the backed for the kronkite-v2 app.

kronkite-server provided an opportunity to build a backend using a more "traditional" backend language--in this case Ruby.

Because important functionality had been discovered in a node module--functionality for which there was no comparable Ruby Gem and building from scratch would have been tedious and time-consuming--kronkite-server was also an opportunity to build a backend using a microservices architecture. 

In order to support tracking Google search trends, a node module that pulls the Google Trends RSS feed is used. 

Because the principal backend (the surface of the backend that touches the client) is written in Ruby, the node module is deployed as a completely independent service that the Ruby backend call via HTTP.

The Ruby backend parses the response from the node-based service and pass that response through to the client. 

The Ruby backend also pulls in responses from the YouTube and Spotify APIs. These responses are augmented and then encapsulated in a JSON response to the client. 

### Architectural Overview

[Here](https://docs.google.com/drawings/d/1po50X0guUbg3VAKvRbZM7yMhzrwHu2FvWJcGEFIsc-U/edit?usp=sharing) is a high level arhitectural overview of kronkite server. 
Components bounded by perforated rectangles are independently deployable units.
Light-green badges indicate the format of an API response (e.g. JSON, XML)
Arrows indicate request/response exchanges: perforated lines denote requests and solid lines denote responses. 

Among the key takeways from developing using this architecture were:
  * a microservices approach can be useful in contexts where different developers speaking different languages need to collaborate on a single product
  * this can be the right approach in situations where a valuable module, package, service or API is only available in a specific language.
  * individual microservices can be independently deployed, upgraded and rewritten. As long as APIs and interfaces remain the same API consumer won't notice any difference.
  * smaller deployments mean the entire app does not need to be re-deployed when a small aspect of the app changes. 
  * this architecture is vastly more complicated to deploy: there must be strongly compelling reasons to pursue this paradigm in developing a product. 
  * error handling must be disciplined. Failures of one service have to be propagated to dependent services. Otherwise the app fails silently.
