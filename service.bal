import ballerina/http;
import ballerina/log;

# A service representing a network-accessible API
# bound to port `9090`.

configurable string basicAuthToken = ?;

configurable string backendURL = ?;

service / on new http:Listener(9090) {

  resource function post sshkeys(http:Caller caller, http:Request req) returns error? {
        

        // Create a new HTTP client to send the request to the backend
        http:Client backendClient = check new(backendURL);
        
        // basic auth header
        req.addHeader("Authorization",base64Encode(basicAuthToken));

        // Forward the request to the backend
        http:Response backendResponse = check backendClient->forward("", req);

        // Extract response payload from the backend response
        var payload = backendResponse.getTextPayload();

        // Check if payload extraction was successful
        if (payload is string) {
            // Create a new HTTP response to send back to the client
            http:Response clientResponse = new;
            clientResponse.setTextPayload(payload);

            // Send the response back to the client
            check caller->respond(clientResponse);
        } else {
             // Handle the error in extracting the payload
            log:printError("Failed to extract payload from backend response", 'error = payload);
            check caller->respond("Failed to process the request");
        }
    }


  resource function post projects(http:Caller caller, http:Request req) returns error? {
    
        // Create a new HTTP client to send the request to the backend
        http:Client backendClient = check new(backendURL);
        
        // basic auth header
        req.addHeader("Authorization",base64Encode(basicAuthToken));
        // Forward the request to the backend
        http:Response backendResponse = check backendClient->forward("", req);

        // Extract response payload from the backend response
        var payload = backendResponse.getTextPayload();

        // Check if payload extraction was successful
        if (payload is string) {
            // Create a new HTTP response to send back to the client
            http:Response clientResponse = new;
            clientResponse.setTextPayload(payload);

            // Send the response back to the client
            check caller->respond(clientResponse);
        } else {
            // Handle the error in extracting the payload
            log:printError("Failed to extract payload from backend response", 'error = payload);
            check caller->respond("Failed to process the request");
        }
    }


      resource function get jobs(http:Caller caller, http:Request req) returns error? {
    
        // Create a new HTTP client to send the request to the backend
        http:Client backendClient = check new(backendURL);
        
        // basic auth header
        req.addHeader("Authorization",base64Encode(basicAuthToken));
        // Forward the request to the backend
        http:Response backendResponse = check backendClient->forward("", req);

        // Extract response payload from the backend response
        var payload = backendResponse.getTextPayload();

        // Check if payload extraction was successful
        if (payload is string) {
            // Create a new HTTP response to send back to the client
            http:Response clientResponse = new;
            clientResponse.setTextPayload(payload);

            // Send the response back to the client
            check caller->respond(clientResponse);
        } else {
            // Handle the error in extracting the payload
            log:printError("Failed to extract payload from backend response", 'error = payload);
            check caller->respond("Failed to process the request");
        }
    }


}




// Function to encode username and password to Base64
function base64Encode(string input) returns string {
    
    return "basic " + input;
}
