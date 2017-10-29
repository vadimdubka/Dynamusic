<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/AlbumLookupDroplet"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<dsp:page>
    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    ALBUM DETAILS

    Description of an album and list of songs.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Album</TITLE>
    </HEAD>
    <BODY>

        <dsp:droplet name="AlbumLookupDroplet">
            <dsp:param name="id" param="itemId"/>
            <dsp:setvalue param="album" paramvalue="element"/>
            <dsp:oparam name="empty">
                <p>Songs are not found</p>
            </dsp:oparam>
            <dsp:oparam name="output">

                <!-- Header -->
                <dsp:include page="common/header.jsp">
                    <dsp:param name="pagename" param="album.title"/>
                </dsp:include>

                <table width="700" cellpadding="8">
                    <tr>
                        <!-- Sidebar -->
                        <td width="100" bgcolor="ghostwhite" valign="top">
                            <dsp:include page="common/sidebar.jsp"></dsp:include>
                        </td>


                        <!-- Page Body -->
                        <td VALIGN=TOP>
                            <!-- *** Start page content *** -->
                            <table CELLPADDING=10>
                                <tr>
                                    <td VALIGN=TOP>
                                        <img src="<dsp:valueof param="album.coverURL"/>" alt="no photo" height=119
                                             width=120>
                                    </td>

                                    <td VALIGN=TOP>
                                        <font face="Geneva,Arial">
                                            <p><dsp:valueof param="album.description"/></p>
                                            <p>Published: <dsp:valueof param="element.date" date="dd.MM.yyyy"/></p>
                                        </font>
                                    </td>
                                </tr>
                            </table>

                            <dsp:droplet name="ForEach">
                                <dsp:param name="array" param="album.songList"/>
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
                        </td>
                    </tr>
                </table>
            </dsp:oparam>
        </dsp:droplet>

    </BODY>
    </HTML>
</dsp:page>