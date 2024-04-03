package com.axonivy.connector.x.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.twitter.api.client.Tweet;
import com.twitter.api.client.User;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;

@IvyProcessTest
public class XTest {

  private static final BpmProcess testee = BpmProcess.path("Twitter");

  @BeforeEach
  void beforeEach(AppFixture fixture) {
    //Disable OAuth feature for mock rest service
    fixture.config("RestClients.Twitter API (Twitter API v2).Features", "ch.ivyteam.ivy.rest.client.mapper.JsonFeature");
    fixture.var("Twitter-connector.Url", "{ivy.app.baseurl}/api/twitterMock");
  }

  @Test
  void findUser(BpmClient bpmClient) throws NoSuchFieldException {
    BpmElement startable = testee.elementName("findUser(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    var user = (User) result.data().last().get("user");
    assertThat(user.getName()).isEqualTo("Axon Ivy");
    assertThat(user.getUsername()).isEqualTo("axonivy");
  }

  @Test
  void findTweets(BpmClient bpmClient) throws NoSuchFieldException {
    BpmElement startable = testee.elementName("findTweets(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    @SuppressWarnings("unchecked")
    var tweets = (List<Tweet>) result.data().last().get("tweets");
    assertThat(tweets).hasSize(1);
    assertThat(tweets.get(0).getText()).isEqualTo("this is a test tweet: axonivy.");
  }
}
