<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500&amp;display=swap" rel="stylesheet"/>
        <style>
        </style>
        
        <title>SITIOS RAROS</title>
    </head>
    <body>
        <header>
            <h1>LUGARES EXTRAÑOS</h1>
        </header>
    <main>
 
            <h2>LUGARES POBLADOS</h2>
            <table id="tablaPoblados">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Localización</th>
                        <th>Descripción</th>
                        <th>Razones por las que está en la tabla</th>
                        <th>Población</th>
                        <th>Mapa</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="places/place">
                        <xsl:sort select="pupulation" data-type="number" order="ascending"/>
                        <xsl:if test="population != 0">
                            <tr>    
                                <td>
                                    <h2><xsl:value-of select="name/text()" /></h2>
                                </td>
                                <td>
                                    <dl>
                                        <li><xsl:value-of select="location/continent/text()"/></li>
                                        <li><xsl:value-of select="location/country/text()"/></li>
                                        <li><xsl:value-of select="location/coordinates/text()"/></li>
                                    </dl>
                                </td>
                                <td>
                                    <p><xsl:value-of select="description/text()"/></p>
                                </td>
                                <td>
                                    <ul>
                                        <xsl:for-each select="reasons/reason">
                                            <li><xsl:value-of select="./text()"/></li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                                <td>
                                    <p><xsl:value-of select="population/text()"/></p> 
                                </td>
                                <td class="google_maps">

                                    <div class="gmap_canvas">
                                        <iframe id="gmap_canvas" frameborder="0" marginheight="0" marginwidth="0">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="link"/>
                                            </xsl:attribute>                                     
                                        </iframe>
                                    </div>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </tbody>
            </table>
            <h2>LUGARES NO POBLADOS O CON POBLACIÓN DESCONOCIDA</h2>
            <table id="tablaNoPoblados">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Localización</th>
                        <th>Descripción</th>
                        <th>Razones por las que está en la tabla</th>
                        <th>Población</th>
                        <th>Mapa</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="places/place">
                        <xsl:sort select="pupulation" data-type="number" order="ascending"/>
                        <xsl:if test="population = 0">
                            <tr>    
                                <td>
                                    <h2><xsl:value-of select="name/text()" /></h2>
                                </td>
                                <td>
                                    <dl>
                                        <li><xsl:value-of select="location/continent/text()"/></li>
                                        <li><xsl:value-of select="location/country/text()"/></li>
                                        <li><xsl:value-of select="location/coordinates/text()"/></li>
                                    </dl>
                                </td>
                                <td>
                                    <p><xsl:value-of select="description/text()"/></p>
                                </td>
                                <td>
                                    <ul>
                                        <xsl:for-each select="reasons/reason">
                                            <li><xsl:value-of select="./text()"/></li>
                                        </xsl:for-each>
                                    </ul>
                                </td>
                                <td>
                                    <p><xsl:value-of select="population/text()"/></p> 
                                </td>
                                <td class="google_maps">

                                    <div class="gmap_canvas">
                                        <iframe id="gmap_canvas" frameborder="0" marginheight="0" marginwidth="0">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="link"/>
                                            </xsl:attribute>                                     
                                        </iframe>
                                    </div>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </tbody>
            </table>   
        </main>  
     </body>   
</html>

</xsl:template>

</xsl:stylesheet> 


