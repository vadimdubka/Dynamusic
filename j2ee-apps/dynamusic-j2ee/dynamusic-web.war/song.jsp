<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:page>

    <%-- Required input param: itemId (id of the song to display --%>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    SONG

    Description of an individual song.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Song</TITLE>
    </HEAD>
    <BODY>
    <dsp:droplet name="/dynamusic/SongLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:oparam name="output">

            <!-- header -->
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="element.title"/>
            </dsp:include>

            <table width="700" cellpadding="8">
                <tr>
                    <!-- Sidebar -->
                    <td width="100" bgcolor="ghostwhite" valign="top">
                        <dsp:include page="common/sidebar.jsp"/>
                    </td>

                    <!-- Page Body -->
                    <td valign="top">
                        <font face="Verdana,Geneva,Arial" size="-1">
                            <table cellpadding="10">
                                <tr>
                                    <td valign="top" align="right"> Song:</td>
                                    <td valign="top">
                                        <font face="Courier New"><b> <dsp:valueof
                                                param="element.title"/> </b>
                                        </font>
                                        &nbsp
                                        <font size=-2 face="Courier New">
                                            <a href="<dsp:valueof param="element.downloadURL"/>">Download</a></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right"> Artist:</td>
                                    <td valign="top">
                                        <font face="Courier New"><b>
                                            <dsp:a href="artistDetails.jsp">
                                                <dsp:param name="itemId" param="element.artist.id"/>
                                                <dsp:valueof param="element.artist.name"/>
                                            </dsp:a> </b></font>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" align="right"> Album(s):</td>
                                    <td valign="top">
                                        <font face="Courier New"><b>
                                            <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                                                <dsp:param name="queryRQL" value="songList INCLUDES :element"/>
                                                <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                                                <dsp:param name="itemDescriptor" value="album"/>
                                                <dsp:oparam name="output">
                                                    <dsp:a href="albumDetails.jsp">
                                                        <dsp:param name="itemId" param="element.id"/>
                                                        <dsp:valueof param="element.title"/>
                                                    </dsp:a>
                                                </dsp:oparam>
                                                <dsp:oparam name="empty">
                                                    No albums found for this song.
                                                </dsp:oparam>
                                            </dsp:droplet>
                                        </b></font>
                                    </td>
                                </tr>
                            </table>

                            <p>
                                <font face="Geneva,Arial" size="-1">
                                    <i><dsp:valueof param="element.description"/></i>
                                </font>
                                <!-- *** End real content *** -->
                        </font>
                    </td>

                    <!-- Playlists informateion-->
                    <td width="150" valign="top">
                        <font face="Verdana,Geneva,Arial" size="-1">

                            <dsp:droplet name="/atg/dynamo/droplet/Switch">
                                <dsp:param bean="Profile.transient" name="value"/>
                                <dsp:oparam name="false">
                                    <dsp:form action="song.jsp" method="post">

                                        <!-- Default form error handling support -->
                                        <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                            <dsp:oparam name="output">
                                                <b><dsp:valueof param="message"/></b><br>
                                            </dsp:oparam>
                                            <dsp:oparam name="outputStart">
                                                <li>
                                            </dsp:oparam>
                                            <dsp:oparam name="outputEnd">
                                                </li>
                                            </dsp:oparam>
                                        </dsp:droplet>

                                        <p><b>Playlists:</b></p>
                                        <dsp:select bean="PlaylistFormHandler.repositoryId" priority="10">
                                            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                                                <dsp:param name="array" bean="Profile.playlists"/>
                                                <dsp:oparam name="output">
                                                    <option value="<dsp:valueof param="element.id"/>">
                                                        <dsp:valueof param="element.name"/>
                                                    </option>
                                                </dsp:oparam>
                                                <dsp:oparam name="empty">
                                                    User has no playlists.
                                                </dsp:oparam>
                                            </dsp:droplet>
                                        </dsp:select>

                                        <%-- this is here so that if the page is redisplayed, it will know which song
                                             item to display --%>
                                        <input type="hidden" name="itemId" value="<dsp:valueof param='itemId'/>"/>
                                        <%-- this is the song ID to add to the selected playlist --%>
                                        <dsp:input type="hidden" bean="PlaylistFormHandler.songId"
                                                   paramvalue="itemId"/>

                                        <dsp:input type="hidden" bean="PlaylistFormHandler.addSongSuccessURL"
                                                   value="playlists.jsp"/>
                                        <dsp:input type="hidden" bean="PlaylistFormHandler.addSongErrorURL"
                                                   value="song.jsp"/>
                                        <dsp:input bean="PlaylistFormHandler.addSong" type="Submit"
                                                   value="Add Song"/>
                                    </dsp:form>
                                </dsp:oparam>
                            </dsp:droplet>
                        </font>
                    </td>
                </tr>
            </table>
        </dsp:oparam>
    </dsp:droplet>
    </BODY>
    </HTML>
</dsp:page>
