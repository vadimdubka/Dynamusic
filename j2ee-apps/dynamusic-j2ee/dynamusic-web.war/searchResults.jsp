<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site DAF Site Mockup

    SEARCH RESULTS

    Display results of a user search, as links to song, artist,
    and album pages.

    ------------------------------------------------------------->

    <HTML>
    <HEAD>
        <TITLE>Dynamusic Search Results</TITLE>
    </HEAD>
    <BODY>
        <dsp:include page="common/header.jsp">
            <dsp:param name="pagename" value="Search"/>
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

                        <p>
                            The following songs match your criteria, <font color="red"><dsp:valueof
                                bean="SongSearchFormHandler.keywordInput"/></font>:
                        </p>

                        <ul>
                            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                                <dsp:param name="array" bean="SongSearchFormHandler.searchResults"/>
                                <dsp:setvalue param="song" paramvalue="element"/>
                                <dsp:oparam name="empty">
                                    <p>Songs are not found</p>
                                </dsp:oparam>
                                <dsp:oparam name="output">
                                    <li>
                                        <dsp:a href="song.jsp">
                                            <dsp:param name="itemId" param="song.id"/>
                                            <dsp:valueof param="song.title"/>
                                        </dsp:a> by
                                        <dsp:a href="artistDetails.jsp">
                                            <dsp:param name="itemId" param="song.artist.id"/>
                                            <dsp:valueof param="song.artist.name"/>
                                        </dsp:a>
                                    </li>
                                </dsp:oparam>
                            </dsp:droplet>
                        </ul>

                    </font>
                </td>
            </tr>
        </table>
    </BODY>
    </HTML>
</dsp:page>
