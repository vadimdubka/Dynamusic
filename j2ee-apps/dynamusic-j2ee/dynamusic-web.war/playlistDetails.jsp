<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
<dsp:page>
    <html>
    <head>
        <title>Playlist details</title>
    </head>
    <body>

    <dsp:droplet name="/dynamusic/PlaylistLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:setvalue param="playlist" paramvalue="element"/>
        <dsp:oparam name="empty">
            <p>Playlist is empty.</p>
        </dsp:oparam>
        <dsp:oparam name="output">

            <!-- Header banner-->
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="playlist.name"/>
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
                            <p><b>Songs of the Playlist:</b></p>
                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" param="playlist.songs"/>
                                <dsp:setvalue param="song" paramvalue="element"/>
                                <dsp:oparam name="empty">
                                    <p>Songs are not found</p>
                                </dsp:oparam>
                                <dsp:oparam name="outputStart">
                                    <ul>
                                </dsp:oparam>
                                <dsp:oparam name="outputEnd">
                                    </ul>
                                </dsp:oparam>
                                <dsp:oparam name="output">
                                    <li>
                                        <font face="Verdana,Geneva,Arial">
                                            <dsp:a href="song.jsp">
                                                <dsp:param name="itemId" param="song.id"/>
                                                <dsp:valueof param="song.title"/>
                                            </dsp:a>
                                        </font>
                                    </li>
                                </dsp:oparam>
                            </dsp:droplet>
                            <p><b>Description:</b></p>
                            <p><dsp:valueof param="playlist.description"/></p>
                        </font>
                    </td>
                </tr>
            </table>
        </dsp:oparam>


    </dsp:droplet>
    </body>
    </html>
</dsp:page>
