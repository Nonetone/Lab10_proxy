<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">

    <table border ="1">

      <thead>

        <tr>
          
          <th>Номер</th>
          <th>Число</th>

        </tr>

      </thead>

      <!--Цикл-->
      <xsl:for-each select="integers/integer">

        <!--Создание переменной-->
        <xsl:variable name="counter" select="position()"/> 

        <tbody>

          <tr>

            <td>
              <!--Извлекаем значение из переменной -->
              <xsl:value-of select="$counter"></xsl:value-of> 
            </td>
            <td>
              <!--Извлекаем значение из XML-тега-->
              <xsl:value-of select="."></xsl:value-of>
            </td>

          </tr>

        </tbody>

      </xsl:for-each>

    </table>

  </xsl:template>

</xsl:stylesheet>







