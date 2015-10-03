from twisted.web import server, resource
from twisted.internet import reactor, endpoints

class Hello(resource.Resource):
    isLeaf = True

    def render_GET(self, request):
        request.setHeader('content-type', 'text/plain')
        return 'Hello World!'

endpoints.serverFromString(reactor, 'tcp:8080').listen(server.Site(Hello()))
reactor.run()

