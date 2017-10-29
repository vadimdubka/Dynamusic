<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    NEW PROFILE

    Allows creation of new user profile

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Edit Profile</TITLE>
    </HEAD>
    <BODY>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Register"/>
    </dsp:include>
    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite">
                <dsp:include page="common/sidebar.jsp"></dsp:include>
            </td>
            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">

                    <!-- *** Start page content *** -->

                    <dsp:form action="newProfile.jsp" method="post">


                        <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">

                            <dsp:oparam name="outputStart">
                                <ul>
                            </dsp:oparam>
                            <dsp:oparam name="output">
                                <li><dsp:valueof param="message"/><br></li>
                            </dsp:oparam>
                            <dsp:oparam name="outputEnd">
                                </ul>
                            </dsp:oparam>

                        </dsp:droplet>


                        <h3>Login information (required)</h3>

                        Login:<br>
                        <dsp:input type="text" bean="ProfileFormHandler.value.login" size="24" required="true"/><br>


                        Password:<br>
                        <dsp:input type="password" bean="ProfileFormHandler.value.password" size="24"
                                   required="true"/><br>


                        Retype password to confirm:<br>
                        <dsp:input bean="ProfileFormHandler.confirmPassword" type="hidden" value="true"
                                   required="true"/>
                        <dsp:input type="password" bean="ProfileFormHandler.value.confirmPassword" size="24"/><br>
                        <hr>

                        <h3>Personal information (optional)</h3>

                        First name:<br>
                        <dsp:input size="24" type="text" bean="ProfileFormHandler.value.firstName"/><br>

                        Last name:<br>
                        <dsp:input size="24" type="text" bean="ProfileFormHandler.value.lastName"/><br><br>

                        State:<br>
                        <dsp:input size="2" type="text" bean="ProfileFormHandler.value.homeAddress.state"/><br>
                        <br>

                        Your favorite genres:<br>
                        <dsp:input type="checkbox" value="pop" bean="ProfileFormHandler.value.prefGenres"/>Pop<br>
                        <dsp:input type="checkbox" value="jazz" bean="ProfileFormHandler.value.prefGenres"/>Jazz<br>
                        <dsp:input type="checkbox" value="classical" bean="ProfileFormHandler.value.prefGenres"/>Classical<br>
                        <dsp:input type="checkbox" value="blues" bean="ProfileFormHandler.value.prefGenres"/>Blues<br>
                        <dsp:input type="checkbox" value="country" bean="ProfileFormHandler.value.prefGenres"/>Country<br>
                        <br>
                        Make your profile viewable by others?<br>
                        <dsp:input type="radio" value="true" bean="ProfileFormHandler.value.shareProfile"/>yes<br>
                        <dsp:input type="radio" value="false" bean="ProfileFormHandler.value.shareProfile"/>no<br>
                        <br>
                        Personal info:<br>
                        <dsp:textarea bean="ProfileFormHandler.value.info" rows="5" cols="40"/><br>
                        <br>

                        <!-- defines the URL to go to on success (relative to 'action')-->
                        <dsp:input type="Submit" value="Register" bean="ProfileFormHandler.create"/>
                        <dsp:input type="hidden" bean="ProfileFormHandler.createSuccessURL" value="home.jsp"/>
                        <dsp:input type="Submit" value="Cancel" bean="ProfileFormHandler.cancel"/>
                        <dsp:input type="hidden" bean="ProfileFormHandler.cancelURL" value="home.jsp"/>

                    </dsp:form>

                    <!-- *** End real content *** -->

                </font>
            </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>
