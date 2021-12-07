[Ivy]
17D805DF41339F2C 9.3.1 #module
>Proto >Proto Collection #zClass
To0 TwitterDemo Big #zClass
To0 B #cInfo
To0 #process
To0 @AnnotationInP-0n ai ai #zField
To0 @TextInP .type .type #zField
To0 @TextInP .processKind .processKind #zField
To0 @TextInP .xml .xml #zField
To0 @TextInP .responsibility .responsibility #zField
To0 @StartRequest f0 '' #zField
To0 @EndTask f1 '' #zField
To0 @UserDialog f5 '' #zField
To0 @PushWFArc f2 '' #zField
To0 @StartRequest f9 '' #zField
To0 @EndTask f7 '' #zField
To0 @PushWFArc f3 '' #zField
To0 @UserDialog f6 '' #zField
To0 @PushWFArc f8 '' #zField
To0 @PushWFArc f4 '' #zField
>Proto To0 To0 TwitterDemo #zField
To0 f0 outLink findUser.ivp #txt
To0 f0 inParamDecl '<> param;' #txt
To0 f0 requestEnabled true #txt
To0 f0 triggerEnabled false #txt
To0 f0 callSignature findUser() #txt
To0 f0 caseData businessCase.attach=true #txt
To0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>findUser.ivp</name>
    </language>
</elementInfo>
' #txt
To0 f0 @C|.responsibility Everybody #txt
To0 f0 81 49 30 30 -31 18 #rect
To0 f1 369 49 30 30 0 15 #rect
To0 f5 dialogId com.axonivy.connector.twitter.connector.demo.ShowUser #txt
To0 f5 startMethod start(String) #txt
To0 f5 requestActionDecl '<String query> param;' #txt
To0 f5 requestMappingAction 'param.query="AxonIvy";
' #txt
To0 f5 responseMappingAction 'out=in;
' #txt
To0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ShowUser</name>
    </language>
</elementInfo>
' #txt
To0 f5 168 42 112 44 -31 -7 #rect
To0 f2 280 64 369 64 #arcP
To0 f9 outLink findTweets.ivp #txt
To0 f9 inParamDecl '<> param;' #txt
To0 f9 requestEnabled true #txt
To0 f9 triggerEnabled false #txt
To0 f9 callSignature findTweets() #txt
To0 f9 caseData businessCase.attach=true #txt
To0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>findTweets.ivp</name>
    </language>
</elementInfo>
' #txt
To0 f9 @C|.responsibility Everybody #txt
To0 f9 81 177 30 30 -25 17 #rect
To0 f7 369 177 30 30 0 15 #rect
To0 f3 111 64 168 64 #arcP
To0 f6 dialogId com.axonivy.connector.twitter.connector.demo.ShowTweets #txt
To0 f6 startMethod start(String) #txt
To0 f6 requestActionDecl '<String query> param;' #txt
To0 f6 requestMappingAction 'param.query="AxonIvy";
' #txt
To0 f6 responseMappingAction 'out=in;
' #txt
To0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ShowTweets</name>
    </language>
</elementInfo>
' #txt
To0 f6 168 170 112 44 -38 -7 #rect
To0 f8 111 192 168 192 #arcP
To0 f4 280 192 369 192 #arcP
>Proto To0 .type com.axonivy.connector.twitter.connector.demo.Data #txt
>Proto To0 .processKind NORMAL #txt
>Proto To0 0 0 32 24 18 0 #rect
>Proto To0 @|BIcon #fIcon
To0 f5 mainOut f2 tail #connect
To0 f2 head f1 mainIn #connect
To0 f0 mainOut f3 tail #connect
To0 f3 head f5 mainIn #connect
To0 f9 mainOut f8 tail #connect
To0 f8 head f6 mainIn #connect
To0 f6 mainOut f4 tail #connect
To0 f4 head f7 mainIn #connect
