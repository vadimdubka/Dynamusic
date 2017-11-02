<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:page>


    <html>
    <head>
        <title>New Playlist</title>
    </head>
    <body>
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="New Playlist"/>
    </dsp:include>

    <table CELLPADDING=8 WIDTH="700">
        <tr>
            <!-- Sidebar -->
            <td width="100" bgcolor="ghostwhite" valign="top">
                <dsp:include page="common/sidebar.jsp"/>
            </td>

            <!-- Page Body -->
            <td>
                <dsp:form action="newPlaylist.jsp" method="post">

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

                    Playlist name:<br>
                    <dsp:input bean="PlaylistFormHandler.value.name" name="name" type="text" required="true"/><br>

                    Description:<br>
                    <dsp:textarea bean="PlaylistFormHandler.value.description" name="description" rows="5"/><br>

                    Make this playlist visible to other users?<br>
                    <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="true"/>yes<br>
                    <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="false"/>no<br>

                    <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

                    <dsp:input bean="PlaylistFormHandler.create" type="Submit" value="Add Playlist"/>
                    <dsp:input bean="PlaylistFormHandler.cancel" type="Submit" value="Cancel"/>
                    <dsp:input bean="PlaylistFormHandler.createSuccessURL" type="hidden" value="playlists.jsp"/>
                    <dsp:input bean="PlaylistFormHandler.cancelURL" type="hidden" value="playlists.jsp"/>
                </dsp:form>
            </td>
        </tr>
    </table>
    </body>
    </html>
</dsp:page>
