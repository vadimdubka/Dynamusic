<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/ArtistLookupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    ARTIST DETAILS

    Description of an artist and list of albums.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artist</TITLE>
    </HEAD>
    <BODY>
    <dsp:droplet name="ArtistLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:setvalue param="atrist" paramvalue="element"/>
        <dsp:oparam name="empty">
            <p>Artist is not found</p>
        </dsp:oparam>

        <dsp:oparam name="output">

            <dsp:droplet name="/dynamusic/ViewItemEventSender">
                <dsp:param name="eventobject" param="element"/>
            </dsp:droplet>

            <!--Header-->
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="atrist.name"/>
            </dsp:include>

            <table width="700" cellpadding="8">
                <tr>

                    <!-- Sidebar -->
                    <td width="100" bgcolor="ghostwhite" valign="top">
                        <dsp:include page="common/sidebar.jsp"/>
                        <br>
                        <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
                            <b>
                                <dsp:a href="editArtist.jsp">
                                    <dsp:param name="artistId" param="atrist.id"/>
                                    Edit Artist Info
                                </dsp:a>
                            </b>
                        </font>
                    </td>

                    <!-- Page Body -->
                    <td VALIGN=TOP>

                        <!-- *** Start page content *** -->
                        <table CELLPADDING=10>
                            <tr>
                                <td VALIGN=TOP>
                                    <img src="<dsp:valueof param="atrist.photoURL"/>" alt="no photo">
                                </td>
                                <td>
                                    <p>
                                        <font face="Geneva,Arial">
                                            <dsp:valueof param="atrist.description"/>
                                        </font>
                                    </p>
                                </td>
                            </tr>
                        </table>

                        <ul>
                            <dsp:droplet name="RQLQueryForEach">
                                <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                                <dsp:param name="itemDescriptor" value="album"/>
                                <dsp:param name="queryRQL" value="artist.id= :atrist.id"/>
                                <dsp:setvalue param="album" paramvalue="element"/>
                                <dsp:oparam name="empty">
                                    <p>Albums are not found</p>
                                </dsp:oparam>
                                <dsp:oparam name="output">
                                    <li>
                                        <font face="Verdana,Geneva,Arial">
                                            <dsp:a href="albumDetails.jsp">
                                                <dsp:param name="itemId" param="album.id"/>
                                                <dsp:param name="dsource" value="artist-details"/>
                                                <dsp:valueof param="album.title"/>
                                            </dsp:a>
                                        </font>
                                    </li>
                                </dsp:oparam>
                            </dsp:droplet>
                        </ul>
                    </td>
                </tr>
            </table>
        </dsp:oparam>
    </dsp:droplet>
    </BODY>
    </HTML>
</dsp:page>