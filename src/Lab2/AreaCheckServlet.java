package Lab2;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class AreaCheckServlet extends HttpServlet {
    private List<Point> list=null;
    private List<Point> temporaryList = null;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(list==null){
            list=new ArrayList<>();
            getServletContext().setAttribute("list",list);
        }
        boolean written = true;
        String check = "";
        List<Point> temp= new ArrayList<>();
        try {
            if (Double.parseDouble(request.getParameter("x")) > 3 || Double.parseDouble(request.getParameter("x")) < -5)
                check += "Неправильное значение x ";
            if (Double.parseDouble(request.getParameter("r")) > 5 || Double.parseDouble(request.getParameter("r")) < 1)
                check += "Неправильное значение r ";
            for (int i = 0; i < request.getParameterValues("y").length; i++) {
                if (Double.parseDouble(request.getParameterValues("y")[i]) > 5 || Double.parseDouble(request.getParameterValues("y")[i]) < -3)
                    check += "Неправильное значение y";
                if (!check.equals(""))
                    break;
                list.add(new Point(Double.parseDouble(request.getParameter("x")), Double.parseDouble(request.getParameterValues("y")[i]), Integer.parseInt(request.getParameter("r"))));
                temp.add(new Point(Double.parseDouble(request.getParameter("x")), Double.parseDouble(request.getParameterValues("y")[i]), Integer.parseInt(request.getParameter("r"))));
            }
        }catch (Exception e){
            getServletContext().setAttribute("exception","Значение/я аргументов неверны!");
            try{if(!request.getParameter("written").equals("yes"))written=false;}catch (Exception ee){written=false;}
            if(written)
                getServletContext().setAttribute("written","yes");
            else
                getServletContext().setAttribute("written","no");
                request.getServletContext().getRequestDispatcher("/checked.jsp").forward(request,response);
        }
            getServletContext().setAttribute("exception",check);
            if(temp.size()!=0) {
                temporaryList = temp;
                getServletContext().setAttribute("tempList", temporaryList);
            }
            try{if(!request.getParameter("written").equals("yes"))written=false;}catch (Exception ee){written=false;}
            if(written)
                getServletContext().setAttribute("written","yes");
            else
                getServletContext().setAttribute("written","no");
            request.getServletContext().getRequestDispatcher("/checked.jsp").forward(request,response);
    }
}
