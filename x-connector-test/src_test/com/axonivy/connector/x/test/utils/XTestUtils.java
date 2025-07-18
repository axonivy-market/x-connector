package com.axonivy.connector.x.test.utils;

import java.util.List;

import com.axonivy.connector.x.test.constants.XTestCommonConstants;

import ch.ivyteam.ivy.environment.AppFixture;

public class XTestUtils {

  public static void setUpConfigForContext(String contextName, AppFixture fixture) {
    switch (contextName) {
      case XTestCommonConstants.REAL_CALL_CONTEXT_DISPLAY_NAME:
        setUpConfigForApiTest(fixture);
        break;
      case XTestCommonConstants.MOCK_SERVER_CONTEXT_DISPLAY_NAME:
        setUpConfigForMockServer(fixture);
        break;
      default:
        break;
    }
  }

  public static void setUpConfigForApiTest(AppFixture fixture) {
    String url = System.getProperty(XTestCommonConstants.URL);
    String key = System.getProperty(XTestCommonConstants.KEY);
    String SecretKey = System.getProperty(XTestCommonConstants.SECRET_KEY);
    fixture.var("XConnector.Url", url);
    fixture.var("XConnector.Key", key);
    fixture.var("XConnector.SecretKey", SecretKey);
  }

  public static void setUpConfigForMockServer(AppFixture fixture) {
    fixture.config("RestClients.X API (X API v2).Features", List.of("ch.ivyteam.ivy.rest.client.mapper.JsonFeature"));
    fixture.var("XConnector.Url", "{ivy.app.baseurl}/api/xMock");
  }
}
