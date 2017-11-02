<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:page>
    <html>
    <head>
        <title>Playlists</title>
    </head>
    <body>

    <!-- Header banner-->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Playlists"/>
    </dsp:include>


    <table width="700" cellpadding="8">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>

                <dsp:droplet name="/atg/dynamo/droplet/Switch">
                    <dsp:param bean="Profile.transient" name="value"/>
                    <dsp:oparam name="false">
                        <hr>
                        <a href="newPlaylist.jsp">Add Playlist</a>
                    </dsp:oparam>
                </dsp:droplet>
            </td>

            <!-- Page Body -->
            <td valign="top">
                <font face="Verdana,Geneva,Arial" size="-1">
                    <!-- *** Start page content *** -->
                    <dsp:droplet name="ForEach">
                        <dsp:param name="array" bean="Profile.playlists"/>
                        <dsp:oparam name="outputStart">
                            <ul>
                        </dsp:oparam>
                        <dsp:oparam name="output">
                            <li>
                                <dsp:a href="playlistDetails.jsp">
                                    <dsp:param name="itemId" param="element.id"/>
                                    <dsp:valueof param="element.name"/>
                                </dsp:a>
                            </li>
                        </dsp:oparam>
                        <dsp:oparam name="outputEnd">
                            </ul>
                        </dsp:oparam>
                        <dsp:oparam name="empty">
                            User hasn't any playlist.
                        </dsp:oparam>
                    </dsp:droplet>
                </font>
            </td>
        </tr>
    </table>

    </body>
    </html>
</dsp:page>

