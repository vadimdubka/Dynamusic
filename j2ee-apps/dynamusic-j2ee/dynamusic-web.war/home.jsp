<%--<%@ taglib prefix="dsp" uri="/dspTaglib"  %>--%>
<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/FeaturedSongs"/>
<dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>


<!-------------------------------------------------------------
Dynamusic Site DAF Site Mockup

HOME

Central page for the site; landing point following login,
providing starting point for site's pages.

Version 4 - adds slot to advertise concerts for viewed
artists.

------------------------------------------------------------->
<dsp:page>
    <HTML>
    <HEAD>
        <TITLE>Dynamusic Home</TITLE>
    </HEAD>
    <BODY>
    <!-- Header banner-->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Home Page"/>
    </dsp:include>
    <!-- End header banner -->

    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>
            <!-- End Sidebar -->

            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">
                    <!-- *** Start page content *** -->
                    <table width="560">
                        <tr>
                            <td>
                                <dsp:droplet name="Switch">
                                    <dsp:param name="value" bean="Profile.transient"/>
                                    <dsp:oparam name="true">
                                        <p>Welcome, Guest! <a href="newProfile.jsp">Create profile!</a></p>
                                    </dsp:oparam>
                                    <dsp:oparam name="false">
                                        <p> Welcome, <dsp:valueof bean="Profile.firstName"/>!</p>
                                    </dsp:oparam>
                                </dsp:droplet>

                                <p>This week's featured songs are:</p>

                                <dsp:droplet name="ForEach">
                                    <dsp:param name="array" bean="FeaturedSongs.songs"/>
                                    <dsp:oparam name="outputStart">
                                        <ul>
                                    </dsp:oparam>
                                    <dsp:oparam name="outputEnd">
                                        </ul>
                                    </dsp:oparam>
                                    <dsp:oparam name="output">
                                        <li><dsp:valueof param="element"/></li>
                                    </dsp:oparam>
                                    <dsp:oparam name="empty">
                                        No featured songs this week.
                                    </dsp:oparam>
                                </dsp:droplet>
                            </td>

                            <!-- Featured Album -->
                            <td width="160" align="center">
                                <dsp:droplet name="/atg/targeting/TargetingForEach">
                                    <dsp:param name="targeter" bean="/atg/registry/Slots/AlbumPromo"/>
                                    <dsp:oparam name="output">
                                        Featured Album:<br>
                                        <dsp:a href="albumDetails.jsp">
                                            <dsp:param name="itemId" param="element.id"/>
                                            <dsp:param name="dsource" value="albumpromo"/>
                                            <img src="<dsp:valueof param='element.coverURL'/>"/><br>
                                            <b><dsp:valueof param='element.title'/></b> -
                                            <dsp:valueof param='element.artist.name'/>
                                        </dsp:a>
                                    </dsp:oparam>
                                </dsp:droplet>
                            </td>
                        </tr>

                        <tr>
                            <td valign="top">Venues near you...
                                <dsp:droplet name="/atg/targeting/TargetingForEach">
                                    <dsp:param name="targeter"
                                               bean="/atg/registry/RepositoryTargeters/EventsRepository/VenueTargeter"/>
                                    <dsp:oparam name="output">
                                        <li>
                                            <dsp:a href="venueDetails.jsp">
                                                <dsp:param name="itemId" param="element.id"/>
                                                <dsp:valueof param="element.name"/>
                                            </dsp:a>
                                        </li>
                                    </dsp:oparam>
                                    <dsp:oparam name="outputStart"> <ul> </dsp:oparam>
                                    <dsp:oparam name="outputEnd"> </ul> </dsp:oparam>
                                </dsp:droplet>
                            </td>

                            <td valign="top">
                                <dsp:droplet name="/atg/targeting/TargetingRandom">
                                    <dsp:param name="targeter"
                                               bean="/atg/registry/RepositoryTargeters/UserProfiles/UserInterestTargeter"/>
                                    <dsp:param name="howMany" value="3"/>
                                    <dsp:oparam name="output">
                                        <li>
                                            <dsp:a href="userDetails.jsp">
                                                <dsp:param name="itemId" param="element.id"/>
                                                <dsp:valueof param="element.firstName"/> <dsp:valueof
                                                    param="element.lastName"/>
                                            </dsp:a>
                                        </li>
                                    </dsp:oparam>
                                    <dsp:oparam name="outputStart">
                                        Users with the same genres:
                                        <ul>
                                    </dsp:oparam>
                                    <dsp:oparam name="outputEnd"> </ul> </dsp:oparam>
                                </dsp:droplet>
                            </td>
                        </tr>


                        <tr>
                            <td valign="top">Playing at a venue near you...
                                <p>
                                <ul>
                                    <li>22 May 2004 - <a href="concertDetails.html">Eric Clapton at the House of
                                        Blues</a>
                                    <li>9 June 2004 - <a href="concertDetails.html">Loreena McKennitt at Sanders
                                        Theater</a>
                                    <li>14 June 2004 - <a href="concertDetails.html">Shania Twain at the Fleet
                                        Center</a>
                                </ul>
                            </td>
                        </tr>

                    </table>
                    <!-- *** End real content *** -->
                </font>
            </td>
        </tr>
    </table>
    </BODY>
    </HTML>
</dsp:page>
