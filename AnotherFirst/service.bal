import ballerina/http;
import ballerina/file;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        json resourcesJSON = check io:fileReadJson("/home/ballerina/resources2.json");
        file:MetaData[] readDirResults = check file:readDir("/home/ballerina/");
        //string absValue = check file:getAbsolutePath("service.bal");
        
        if name is "" {
            return error("name should not be empty!");
        }
        return "Oh Hello AnotherFirst, " + name + "json is : " + resourcesJSON.toJsonString() + " Absoulte path is : " + readDirResults.toJsonString();
    }
}
