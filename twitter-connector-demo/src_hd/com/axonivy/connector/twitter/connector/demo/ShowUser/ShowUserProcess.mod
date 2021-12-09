[Ivy]
17D806AC43051BEB 9.3.1 #module
>Proto >Proto Collection #zClass
Ss0 ShowUserProcess Big #zClass
Ss0 RD #cInfo
Ss0 #process
Ss0 @AnnotationInP-0n ai ai #zField
Ss0 @TextInP .type .type #zField
Ss0 @TextInP .processKind .processKind #zField
Ss0 @TextInP .xml .xml #zField
Ss0 @TextInP .responsibility .responsibility #zField
Ss0 @UdInit f0 '' #zField
Ss0 @UdProcessEnd f1 '' #zField
Ss0 @UdEvent f3 '' #zField
Ss0 @UdExitEnd f4 '' #zField
Ss0 @PushWFArc f5 '' #zField
Ss0 @CallSub f6 '' #zField
Ss0 @PushWFArc f7 '' #zField
Ss0 @PushWFArc f2 '' #zField
Ss0 @UdEvent f8 '' #zField
Ss0 @PushWFArc f9 '' #zField
Ss0 @ErrorBoundaryEvent f10 '' #zField
Ss0 @PushWFArc f11 '' #zField
>Proto Ss0 Ss0 ShowUserProcess #zField
Ss0 f0 guid 17D806AC4343B298 #txt
Ss0 f0 method start(String) #txt
Ss0 f0 inParameterDecl '<String query> param;' #txt
Ss0 f0 inParameterMapAction 'out.query=param.query;
' #txt
Ss0 f0 outParameterDecl '<> result;' #txt
Ss0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start(String)</name>
    </language>
</elementInfo>
' #txt
Ss0 f0 83 51 26 26 -33 25 #rect
Ss0 f1 339 51 26 26 0 12 #rect
Ss0 f3 guid 17D806AC43E5AA29 #txt
Ss0 f3 actionTable 'out=in;
' #txt
Ss0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>close</name>
    </language>
</elementInfo>
' #txt
Ss0 f3 83 243 26 26 -16 15 #rect
Ss0 f4 339 243 26 26 0 12 #rect
Ss0 f5 109 256 339 256 #arcP
Ss0 f6 processCall Twitter:findUser(String) #txt
Ss0 f6 requestActionDecl '<String username> param;' #txt
Ss0 f6 requestMappingAction 'param.username=in.query;
' #txt
Ss0 f6 responseMappingAction 'out=in;
out.user=result.user;
' #txt
Ss0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>find User</name>
    </language>
</elementInfo>
' #txt
Ss0 f6 168 42 112 44 -28 -7 #rect
Ss0 f7 109 64 168 64 #arcP
Ss0 f2 280 64 339 64 #arcP
Ss0 f8 guid 17D8075B35A3EF4A #txt
Ss0 f8 actionTable 'out=in;
' #txt
Ss0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>update</name>
    </language>
</elementInfo>
' #txt
Ss0 f8 83 147 26 26 -17 15 #rect
Ss0 f9 109 160 224 86 #arcP
Ss0 f9 1 224 160 #addKink
Ss0 f9 0 0.8128411777826612 0 0 #arcLabel
Ss0 f10 actionTable 'out=in;
' #txt
Ss0 f10 actionCode 'import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "User not found", ""));' #txt
Ss0 f10 attachedToRef 17D806AC43051BEB-f6 #txt
Ss0 f10 241 81 30 30 0 15 #rect
Ss0 f11 271 96 352 77 #arcP
Ss0 f11 1 352 96 #addKink
Ss0 f11 0 0.7132088399897597 0 0 #arcLabel
>Proto Ss0 .type com.axonivy.connector.twitter.connector.demo.ShowUser.ShowUserData #txt
>Proto Ss0 .processKind HTML_DIALOG #txt
>Proto Ss0 -8 -8 16 16 16 26 #rect
Ss0 f3 mainOut f5 tail #connect
Ss0 f5 head f4 mainIn #connect
Ss0 f0 mainOut f7 tail #connect
Ss0 f7 head f6 mainIn #connect
Ss0 f6 mainOut f2 tail #connect
Ss0 f2 head f1 mainIn #connect
Ss0 f8 mainOut f9 tail #connect
Ss0 f9 head f6 mainIn #connect
Ss0 f10 mainOut f11 tail #connect
Ss0 f11 head f1 mainIn #connect
