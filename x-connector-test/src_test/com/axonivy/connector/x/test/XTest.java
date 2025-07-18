package com.axonivy.connector.x.test;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.TestTemplate;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.extension.ExtensionContext;

import com.axonivy.connector.x.XData;
import com.axonivy.connector.x.test.constants.XTestCommonConstants;
import com.axonivy.connector.x.test.context.MultiEnvironmentContextProvider;
import com.axonivy.connector.x.test.utils.XTestUtils;
import com.twitter.api.client.Tweet;
import com.twitter.api.client.User;

import ch.ivyteam.ivy.bpm.engine.client.BpmClient;
import ch.ivyteam.ivy.bpm.engine.client.ExecutionResult;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmElement;
import ch.ivyteam.ivy.bpm.engine.client.element.BpmProcess;
import ch.ivyteam.ivy.bpm.exec.client.IvyProcessTest;
import ch.ivyteam.ivy.environment.AppFixture;

@IvyProcessTest(enableWebServer = true)
@ExtendWith(MultiEnvironmentContextProvider.class)
public class XTest {

  private static final BpmProcess testee = BpmProcess.path("X");
  private static final BpmElement ERROR_FIND_USER = BpmElement.pid("17D8046C692CA8F3-f49");
  private static final BpmElement ERROR_FIND_TWEETS = BpmElement.pid("17D8046C692CA8F3-f10");

  @BeforeEach
  void beforeEach(ExtensionContext context, AppFixture fixture) {
    XTestUtils.setUpConfigForContext(context.getDisplayName(), fixture);
  }

  @TestTemplate
  void findUser(BpmClient bpmClient, ExtensionContext context) throws NoSuchFieldException {
    boolean isRealCall = context.getDisplayName().equals(XTestCommonConstants.REAL_CALL_CONTEXT_DISPLAY_NAME);
    BpmElement startable = testee.elementName("findUser(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    var user = (User) result.data().last().get("user");
    if (isRealCall) {
      XData xData = result.data().lastOnElement(ERROR_FIND_USER);
      if (xData != null && xData.getError() != null) {
        int errorCode = (int) xData.getError().getAttribute("RestClientResponseStatusCode");
        assertThat(errorCode).isEqualTo(429);
        return;
      }
    }
    assertThat(user.getName()).isEqualTo("Axon Ivy");
    assertThat(user.getUsername()).isEqualTo("axonivy");
  }

  @TestTemplate
  void findTweets(BpmClient bpmClient, ExtensionContext context) throws NoSuchFieldException {
    boolean isRealCall = context.getDisplayName().equals(XTestCommonConstants.REAL_CALL_CONTEXT_DISPLAY_NAME);
    BpmElement startable = testee.elementName("findTweets(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    @SuppressWarnings("unchecked")
    var tweets = (List<Tweet>) result.data().last().get("tweets");
    if (isRealCall) {
      XData xData = result.data().lastOnElement(ERROR_FIND_TWEETS);
      if (xData != null && xData.getError() != null) {
        int errorCode = (int) xData.getError().getAttribute("RestClientResponseStatusCode");
        assertThat(errorCode).isEqualTo(429);
      }
      assertThat(tweets).hasSize(0);
      return;
    }
    assertThat(tweets).hasSize(1);
    assertThat(tweets.get(0).getText()).isEqualTo("this is a test tweet: axonivy.");
  }
}
