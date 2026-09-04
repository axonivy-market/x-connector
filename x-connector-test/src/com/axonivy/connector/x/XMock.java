package com.axonivy.connector.x;

import jakarta.annotation.security.PermitAll;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import io.swagger.v3.oas.annotations.Hidden;

@Path("xMock/2")
@PermitAll
@Hidden
public class XMock {

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
