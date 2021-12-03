[Ivy]
17D8046C692CA8F3 9.2.0 #module
>Proto >Proto Collection #zClass
Tr0 Twitter Big #zClass
Tr0 B #cInfo
Tr0 #process
Tr0 @AnnotationInP-0n ai ai #zField
Tr0 @TextInP .type .type #zField
Tr0 @TextInP .processKind .processKind #zField
Tr0 @TextInP .xml .xml #zField
Tr0 @TextInP .responsibility .responsibility #zField
Tr0 @StartSub f0 '' #zField
Tr0 @EndSub f1 '' #zField
Tr0 @RestClientCall f3 '' #zField
Tr0 @PushWFArc f4 '' #zField
Tr0 @PushWFArc f2 '' #zField
Tr0 @RestClientCall f5 '' #zField
Tr0 @StartSub f6 '' #zField
Tr0 @EndSub f7 '' #zField
Tr0 @PushWFArc f8 '' #zField
Tr0 @PushWFArc f9 '' #zField
>Proto Tr0 Tr0 Twitter #zField
Tr0 f0 inParamDecl '<String username> param;' #txt
Tr0 f0 inParamInfo 'username.description=The user which you want to find in Twitter' #txt
Tr0 f0 inParamTable 'out.username=param.username;
' #txt
Tr0 f0 outParamDecl '<com.twitter.api.client.User user> result;' #txt
Tr0 f0 outParamInfo 'user.description=The user which was found by the request' #txt
Tr0 f0 outParamTable 'result.user=in.user;
' #txt
Tr0 f0 callSignature findUser(String) #txt
Tr0 f0 tags CONNECTOR #txt
Tr0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>findUser(String)</name>
    </language>
</elementInfo>
' #txt
Tr0 f0 81 49 30 30 -49 23 #rect
Tr0 f0 res:/webContent/icons/twitter.png?small #fDecoratorIcon
Tr0 f1 337 49 30 30 0 15 #rect
Tr0 f3 clientId 0b74edb8-5459-4ccc-aac7-505531e06398 #txt
Tr0 f3 path /2/users/by/username/{username} #txt
Tr0 f3 queryParams 'expansions=;
tweet.fields=;
user.fields=;
' #txt
Tr0 f3 templateParams 'username=in.username;
' #txt
Tr0 f3 resultType com.twitter.api.client.SingleUserLookupResponse #txt
Tr0 f3 responseMapping 'out.user=result.data;
' #txt
Tr0 f3 clientErrorCode ivy:error:rest:client #txt
Tr0 f3 statusErrorCode ivy:error:rest:client #txt
Tr0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Twitter API (Twitter API v2)</name>
    </language>
</elementInfo>
' #txt
Tr0 f3 136 42 176 44 -81 -7 #rect
Tr0 f3 res:/webContent/icons/twitter.png #fDecoratorIcon
Tr0 f4 111 64 136 64 #arcP
Tr0 f2 312 64 337 64 #arcP
Tr0 f5 clientId 0b74edb8-5459-4ccc-aac7-505531e06398 #txt
Tr0 f5 path /2/tweets/search/recent #txt
Tr0 f5 queryParams 'expansions=;
tweet.fields=;
user.fields=;
query=in.query;
start_time=;
end_time=;
since_id=;
until_id=;
max_results=;
next_token=;
media.fields=;
place.fields=;
poll.fields=;
' #txt
Tr0 f5 templateParams 'username=;
' #txt
Tr0 f5 resultType com.twitter.api.client.TweetSearchResponse #txt
Tr0 f5 responseMapping 'out.tweets=result.data;
' #txt
Tr0 f5 clientErrorCode ivy:error:rest:client #txt
Tr0 f5 statusErrorCode ivy:error:rest:client #txt
Tr0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>Twitter API (Twitter API v2)</name>
    </language>
</elementInfo>
' #txt
Tr0 f5 136 170 176 44 -81 -7 #rect
Tr0 f5 res:/webContent/icons/twitter.png #fDecoratorIcon
Tr0 f6 inParamDecl '<String query> param;' #txt
Tr0 f6 inParamInfo 'query.description=The query to find tweets' #txt
Tr0 f6 inParamTable 'out.query=param.query;
' #txt
Tr0 f6 outParamDecl '<java.util.List<com.twitter.api.client.Tweet> tweets> result;' #txt
Tr0 f6 outParamInfo 'tweets.description=The tweets which were found by the request' #txt
Tr0 f6 outParamTable 'result.tweets=in.tweets;
' #txt
Tr0 f6 callSignature findTweets(String) #txt
Tr0 f6 tags CONNECTOR #txt
Tr0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>findTweets(String)</name>
    </language>
</elementInfo>
' #txt
Tr0 f6 81 177 30 30 -49 23 #rect
Tr0 f6 res:/webContent/icons/twitter.png?small #fDecoratorIcon
Tr0 f7 337 177 30 30 0 15 #rect
Tr0 f8 312 192 337 192 #arcP
Tr0 f9 111 192 136 192 #arcP
>Proto Tr0 .type com.axonivy.connector.twitter.TwitterData #txt
>Proto Tr0 .processKind CALLABLE_SUB #txt
>Proto Tr0 0 0 32 24 18 0 #rect
>Proto Tr0 @|BIcon #fIcon
Tr0 f0 mainOut f4 tail #connect
Tr0 f4 head f3 mainIn #connect
Tr0 f3 mainOut f2 tail #connect
Tr0 f2 head f1 mainIn #connect
Tr0 f6 mainOut f9 tail #connect
Tr0 f9 head f5 mainIn #connect
Tr0 f5 mainOut f8 tail #connect
Tr0 f8 head f7 mainIn #connect
