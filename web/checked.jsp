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
    <script type="text/javascript" src="script.js"></script>
    <script src="jquery-3.2.1.js"></script>
    <script type="text/javascript">
        <%@include file="script.js"%>//TODO?
    </script>

<body class = <% boolean b = false; List<Point> tempList=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("tempList");
for(int i = 0;i<tempList.size();i++){
    if(tempList.get(i).isInArea()){
        out.print("\"rip\"");
        b=true;
        break;
    }
}%> >
    <img src="images/petux.png" onload=<%

            List<Point> list=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("tempList");

            if(list!=null&&getServletConfig().getServletContext().getAttribute("written").equals("yes")){
                String x = "["+list.get(0).getX();
                String y = "["+list.get(0).getY();
                String r = "["+list.get(0).getR();

                for(int i=1;i<list.size();i++){
                    x+=","+list.get(i).getX();
                    y+=","+list.get(i).getY();
                    r+=","+list.get(i).getR();
                }
                x+="]";
                y+="]";
                r+="]";
                out.print("\"onloadcheck("+x+"," + y+"," + r+ ")\"");
            }
        %> alt="Laba" width="290"  class=<%if(b)out.print("\"rightpic rip_\"");else out.print("\"rightpic\"");%>/>
    <%if(getServletConfig().getServletContext().getAttribute(("exception"))!=null)out.println(getServletConfig().getServletContext().getAttribute(("exception")));%>
    <%
            list=(ArrayList<Point>)getServletConfig().getServletContext().getAttribute("tempList");

            if(list!=null){
                if (b)
                    out.println("<table border=\"1\" bordercolor=\"red\" class=\"rip_\" id=\"resultTable\" >");
                else
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
    <input type="button" class=<%if(b)out.print("\"rip_\"");else out.print("\"notrip\"");%> value="back" id="back"/>
          <div align="center" class=<%if(b)out.print("\"editor editor_VB rip_\"");else out.print("\"editor editor_VB\"");%> id=<%if(b)out.print("\"rip1\"");%>>Влад Беспалов<br> гр.P3211</div>
          <div align="center" class=<%if(b)out.print("\"editor editor_DT rip_\"");else out.print("\"editor editor_DT\"");%> id=<%if(b)out.print("\"rip2\"");%>>Данил Татаринов<br>  гр.P3211</div>
          <audio id="player"  src=<%if(b)out.print("\"music/run.mp3\"");else out.print("\"music/kokoko.mp3\"");%>autoplay loop></audio>
          <div class="player">
              <button class=<%if(b)out.print("\"mus_but play_paus rip_\"");else out.print("\"mus_but play_paus\"");%> onclick="document.getElementById('player').play()">Плей</button>
              <button class=<%if(b)out.print("\"mus_but play_paus rip_\"");else out.print("\"mus_but play_paus\"");%> onclick="document.getElementById('player').pause()">Пауза</button>
              <button class=<%if(b)out.print("\"mus_but play_paus rip_\"");else out.print("\"mus_but play_paus\"");%> onclick="document.getElementById('player').volume+=0.1">+</button>
              <button class=<%if(b)out.print("\"mus_but play_paus rip_\"");else out.print("\"mus_but play_paus\"");%> onclick="document.getElementById('player').volume-=0.1">-</button>
          </div>
</body>

</html>