package com.axonivy.connector.twitter;

import javax.annotation.security.PermitAll;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import io.swagger.v3.oas.annotations.Hidden;

@Path("twitterMock/2")
@PermitAll
@Hidden
public class TwitterMock {

  @GET
  @Path("users/by/username/{username}")
  @Produces(MediaType.APPLICATION_JSON)
  public Response findUser(@PathParam("username") String username) {
    return Response.status(200)
            .entity("{\n"
                    + "    \"data\": {\n"
                    + "        \"id\": \"2829273353\",\n"
                    + "        \"name\": \"Axon Ivy\",\n"
                    + "        \"username\": \"" + username + "\"\n"
                    + "    }\n"
                    + "}")
            .build();
  }

  @GET
  @Path("tweets/search/recent")
  @Produces(MediaType.APPLICATION_JSON)
  public Response findTweets(@QueryParam("query") String query) {
    return Response.status(200)
            .entity("{\n"
                    + "    \"data\": [\n"
                    + "        {\n"
                    + "            \"id\": \"1466242658364391426\",\n"
                    + "            \"text\": \"this is a test tweet: " + query + ".\"\n"
                    + "        }\n"
                    + "    ],\n"
                    + "    \"meta\": {\n"
                    + "        \"newest_id\": \"1466242658364391426\",\n"
                    + "        \"oldest_id\": \"1466242658364391426\",\n"
                    + "        \"result_count\": 1\n"
                    + "    }\n"
                    + "}")
            .build();
  }
}
