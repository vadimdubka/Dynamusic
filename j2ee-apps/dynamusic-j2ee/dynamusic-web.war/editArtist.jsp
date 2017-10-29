<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>

<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site DAF Site Mockup

    EDIT ARTIST

    Modify description of an artist and her/his list of albums.
    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artist</TITLE>
    </HEAD>
    <BODY>
        <dsp:include page="common/header.jsp">
            <dsp:param name="pagename" value="Edit Artist"/>
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

                        <!-- *** Start page content *** -->
                        <dsp:setvalue bean="ArtistFormHandler.repositoryId" paramvalue="artistId"/>

                        <dsp:form action="editArtist.jsp" method="post">

                            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                                <dsp:oparam name="output">
                                    <dsp:valueof param="message"/> <br>
                                </dsp:oparam>
                            </dsp:droplet>

                            <table cellpadding="10">

                                <tr>
                                    <td valign="middle"> Artist Name:</td>
                                    <td valign="middle">
                                        <dsp:input type="text" bean="ArtistFormHandler.value.name" required="true"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td valign="middle">Image Path:</td>
                                    <td valign="middle">
                                        <dsp:input type="text" bean="ArtistFormHandler.value.photoURL"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td valign="top">Description:</td>
                                    <td valign="top">
                                        <dsp:textarea cols="60" bean="ArtistFormHandler.value.description" rows="10"
                                                      wrap="SOFT"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                    <td>
                                        <dsp:input type="submit" bean="ArtistFormHandler.update"
                                                   value="Save Changes"/>
                                        <dsp:input type="submit" bean="ArtistFormHandler.delete"
                                                   value="Delete This Artist"/>
                                        <dsp:input type="hidden" bean="ArtistFormHandler.repositoryId"
                                                   paramvalue="artistId" name="artistId"/>
                                        <dsp:input type="hidden" bean="ArtistFormHandler.updateSuccessURL"
                                                   value="artists.jsp"/>
                                        <dsp:input type="hidden" bean="ArtistFormHandler.deleteSuccessURL"
                                                   value="artists.jsp"/>
                                    </td>
                                </tr>

                            </table>
                        </dsp:form>

                    </font>
                </td>
            </tr>
        </table>
    </BODY>
    </HTML>

</dsp:page>


