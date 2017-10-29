<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>

<dsp:page>

    <!-------------------------------------------------------------
    Dynamusic Site Mockup
    SEARCH
    User can search for a song, using a fragment of its title.
    ------------------------------------------------------------->


    <HTML>
    <HEAD>
        <TITLE>Dynamusic Home</TITLE>
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

                        <p><i>Please enter the name (or first few characters) of the song you're looking for:</i></p>
                        <br>

                        <dsp:form action="searchResults.jsp" method="post">

                            <table>
                                <tr>
                                    <td>
                                        <dsp:input type="text" bean="SongSearchFormHandler.keywordInput" required="true"
                                                   size="40"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <dsp:input type="submit" bean="SongSearchFormHandler.search" value="search"/>
                                        <dsp:input type="hidden" bean="SongSearchFormHandler.successURL"
                                                   value="searchResults.jsp"/>
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
