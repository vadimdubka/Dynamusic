<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/dynamo/droplet/RQLQueryForEach"/>
<dsp:page>
    <!-------------------------------------------------------------
    Dynamusic Site Mockup

    ARTISTS

    List of artists whose songs appear on this site.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Artists</TITLE>
    </HEAD>
    <BODY>

        <dsp:include page="common/header.jsp">
            <dsp:param name="pagename" value="Artists"/>
        </dsp:include>
        <table width="700" cellpadding="8">
            <tr>
                <!-- Sidebar -->
                <td width="100" bgcolor="ghostwhite" valign="top">
                    <dsp:include page="common/sidebar.jsp"/>
                    <br>
                    <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
                        <b><dsp:a href="newArtist.jsp">Add Artist</dsp:a></b>
                    </font>
                </td>

                <!-- Page Body -->
                <td VALIGN=TOP>
                    <!-- *** Start page content *** -->
                    <ol>
                        <dsp:droplet name="RQLQueryForEach">
                            <dsp:param name="repository" bean="/dynamusic/SongsRepository"/>
                            <dsp:param name="itemDescriptor" value="artist"/>
                            <dsp:param name="queryRQL" value="ALL ORDER BY name"/>
                            <dsp:oparam name="output">
                                <font face="Verdana,Geneva,Arial">
                                    <li>
                                        <dsp:a href="artistDetails.jsp">
                                            <dsp:param name="itemId" param="element.id"/>
                                            <dsp:valueof param="element.name"/>
                                        </dsp:a>
                                    </li>
                                </font>
                            </dsp:oparam>
                            <dsp:oparam name="isEmpty">
                                <p>Repository has no artists.</p>
                            </dsp:oparam>
                        </dsp:droplet>
                    </ol>
                </td>
        </table>
    </BODY>
    </HTML>
</dsp:page>

