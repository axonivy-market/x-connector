package com.axonivy.connector.x.test;

import static org.assertj.core.api.Assertions.assertThat;
import static com.axonivy.utils.e2etest.enums.E2EEnvironment.REAL_SERVER;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.TestTemplate;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.extension.ExtensionContext;

import com.axonivy.connector.x.XData;
import com.axonivy.connector.x.test.constants.XTestCommonConstants;
import com.axonivy.utils.e2etest.context.MultiEnvironmentContextProvider;
import com.axonivy.utils.e2etest.utils.E2ETestUtils;
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
  private boolean isRealTest;

  @BeforeEach
  void beforeEach(ExtensionContext context, AppFixture fixture) {
    isRealTest = context.getDisplayName().equals(REAL_SERVER.getDisplayName());
    E2ETestUtils.determineConfigForContext(context.getDisplayName(), runRealEnv(fixture), runMockEnv(fixture));
  }

  @TestTemplate
  void findUser(BpmClient bpmClient, ExtensionContext context) throws NoSuchFieldException {
    BpmElement startable = testee.elementName("findUser(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    var user = (User) result.data().last().get("user");
    if (isRealTest) {
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
    BpmElement startable = testee.elementName("findTweets(String)");
    ExecutionResult result = bpmClient.start().subProcess(startable).execute("axonivy");
    @SuppressWarnings("unchecked")
    var tweets = (List<Tweet>) result.data().last().get("tweets");
    if (isRealTest) {
      XData xData = result.data().lastOnElement(ERROR_FIND_TWEETS);
      if (xData != null && xData.getError() != null) {
        int errorCode = (int) xData.getError().getAttribute("RestClientResponseStatusCode");
        assertThat(errorCode).isEqualTo(429);
      } else {
        assertThat(tweets).hasSizeGreaterThan(0);
      }
      return;
    }
    assertThat(tweets).hasSize(1);
    assertThat(tweets.get(0).getText()).isEqualTo("this is a test tweet: axonivy.");
  }

  private Runnable runRealEnv(AppFixture fixture) {
    return () -> {
      String url = System.getProperty(XTestCommonConstants.URL);
      String key = System.getProperty(XTestCommonConstants.KEY);
      String SecretKey = System.getProperty(XTestCommonConstants.SECRET_KEY);
      fixture.var("XConnector.Url", url);
      fixture.var("XConnector.Key", key);
      fixture.var("XConnector.SecretKey", SecretKey);
    };
  }

  private Runnable runMockEnv(AppFixture fixture) {
    return () -> {
      fixture.config("RestClients.X API (X API v2).Features", List.of("ch.ivyteam.ivy.rest.client.mapper.JsonFeature"));
      fixture.var("XConnector.Url", "{ivy.app.baseurl}/api/xMock");
    };
  }
}
