<%--
  Created by IntelliJ IDEA.
  User: vladlensky
  Date: 24.09.17
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.List, java.util.ArrayList, Lab2.Point"%>
<!DOCTYPE HTML>
<html>

<head>
  <meta charset="UTF-8"/>
  <title>Лабораторная №2</title>
    <style>
        <%@include file="style.css"%>
    </style>
  <link rel="icon" href="images/favicon.ico"/>
    <script src="jquery-3.2.1.js"></script>
  <script type="text/javascript" src="script.js"></script>
</head>
<body class = "alive">
<div class="wrapper">
    <div class="content">
<form method="get">
    <img src="images/petux.png"  alt="Laba" width="290" id="find"  class="rightpic"/>
    <table class = "form">
        <tr>
            <td><label for="field_x">X[-5;3]</label></td>
            <td><input onkeypress="return ((event.keyCode>47)&&(event.keyCode<58)||((event.keyCode===45)&&(document.getElementById('field_x').value!=='-')&&(document.getElementById('field_x').value===''))||((event.keyCode===46)&&(document.getElementById('field_x').value!==''&&document.getElementById('field_x').value!=='-')&&(!String(document.getElementById('field_x').value).includes('.'))))" name="x" id="field_x" /></td>
        </tr>
        <tr>
            <td rowspan=9>Y[-3;5]</td>
            <td><input type="checkbox" value="5" name="y" id="field_y_5" />
                <label class="checkbox" for="field_y_5">5</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="4" name="y" id="field_y_4" />
                <label class="checkbox" for="field_y_4">4</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="3" name="y" id="field_y_3" />
                <label class="checkbox" for="field_y_3">3</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="2" name="y" id="field_y_2" />
                <label class="checkbox" for="field_y_2">2</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="1" name="y" id="field_y_1" />
                <label class="checkbox" for="field_y_1">1</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="0" name="y" id="field_y_0" />
                <label class="checkbox" for="field_y_0">0</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="-1" name="y" id="field_y_-1" />
                <label class="checkbox" for="field_y_-1">-1</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="-2" name="y" id="field_y_-2" />
                <label class="checkbox" for="field_y_-2">-2</label></td>
        </tr>
        <tr>
            <td><input type="checkbox" value="-3" name="y" id="field_y_-3" />
                <label class="checkbox" for="field_y_-3">-3</label></td>
        </tr>
        <tr>
            <td>R[1;5]</td>
            <td>
                <select id='field_r' name="r">
                    <option value="1" class="check_r">1</option>
                    <option value="2" class="check_r">2</option>
                    <option value="3" class="check_r">3</option>
                    <option value="4" class="check_r">4</option>
                    <option value="5" class="check_r">5</option>
                </select></td>
        </tr>
        <tr>
            <td colspan=2><input type="submit" class="form" id="subm" onmousedown="return proverka()" value="Submit" /></td>
        </tr>
    </table>
</form>
        <%
            List<Point> list=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("list");

            if(list!=null){
                out.println("<table border=\"1\" bordercolor=\"red\" id=\"resultTable\" >");
                out.println("<tr>");
                out.println("<td>");
                out.println("X coordinate");
                out.println("</td>");
                out.println("<td>");
                out.println("Y coordinate");
                out.println("</td>");
                out.println("<td>");
                out.println("Radius");
                out.println("</td>");
                out.println("<td>");
                out.println("Bullet");
                out.println("</td>");
                out.println("</tr>");

                for(int i=0;i<list.size();i++){
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(list.get(i).getX());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(list.get(i).getY());
                    out.println("</td>");
                    out.println("<td>");
                    out.println(list.get(i).getR());
                    out.println("</td>");
                    out.println("<td>");

                    if(list.get(i).isInArea()){
                        out.println("Hit");
                    }
                    else{
                        out.println("Didn't hit");
                    }

                    out.println("</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        %>
</div>
    <div align="center" class="editor editor_VB">Влад Беспалов<br> гр.P3211</div>
    <div align="center" class="editor editor_DT">Данил Татаринов<br>  гр.P3211</div>
    <audio id="player" src="music/kokoko.mp3" autoplay loop></audio>
    <div class="player">
        <button class="mus_but play_paus" onclick="document.getElementById('player').play()">Плей</button>
        <button class="mus_but play_paus"onclick="document.getElementById('player').pause()">Пауза</button>
        <button class="mus_but plus_minus" onclick="document.getElementById('player').volume+=0.1">+</button>
        <button class="mus_but plus_minus" onclick="document.getElementById('player').volume-=0.1">-</button>
    </div>
</div>
</body>
</html>