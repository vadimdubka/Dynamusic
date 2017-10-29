<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>

<dsp:page>
    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    Sidebar

    Page fragment displaying the sidebar, common to all pages.

    ------------------------------------------------------------->


    <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
        <b>
            <a href="home.jsp">Home</a><br>
            <br>
            <a href="artists.jsp">Artists</a> <br>
            <a href="venues.jsp">Venues</a> <br>
            <a href="search.jsp">Search</a> <br>
            <dsp:droplet name="Switch">
                <dsp:param name="value" bean="Profile.transient"/>
                <dsp:oparam name="true">
                    <br>
                    <a href="login.jsp">Log In</a> <br>
                </dsp:oparam>
                <dsp:oparam name="false">
                    <a href="playlists.jsp">Playlists</a> <br>
                    <a href="updateProfile.jsp">Profile</a> <br>
                    <br>
                    <a href="logout.jsp">Log Out</a> <br>
                </dsp:oparam>
            </dsp:droplet>

        </b>
    </font>
</dsp:page>

