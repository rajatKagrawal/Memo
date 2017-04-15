<%-- 
    Document   : del
    Created on : 14 Apr, 2017, 11:39:26 PM
    Author     : rajat
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#f44336">
        <h1>Hello World!</h1>
         <%!
            public class memo
           {
            String databaseURL = "jdbc:mysql://localhost:3306/general";
            String user = "root";
            String password = "rajat";
            Connection conn =null;
            PreparedStatement inst=null;
            ResultSet res=null;

            memo()
            {
                try{
                    conn=DriverManager.getConnection(databaseURL,user,password);
                    inst=conn.prepareStatement("DELETE from memo where sub like ?");
                    }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            

             public int delMemo(String roll)
            {
                int result=0;
                try{
                    inst.setString(1,roll);
                    result=inst.executeUpdate();
                }
                catch(Exception e){
                        e.printStackTrace();
                    }
                return result;
            }

            }
            %>
        
            <%
                int result;
                String sub,text;
                if(request.getParameter("DELETE")!=null)
            {
             
                //text=new String();
                 sub=new String();
            if(request.getParameter("sub")!=null){
            sub=request.getParameter("sub");
            }
             memo add=new memo();
            result=add.delMemo(sub);
            }
            
            
               
               // memo a=new memo();
                //a.setMemo("tyurp","gsdfdsjfgajdgsdhghfsgdsdagkffhsdhgff");
                %>
        
   <form action="del.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Sub</td>
                        <td><input type="text" name="sub" value="" /></td>
                    </tr>
                </tbody>
            </table>
           <input type="submit" value="DELETE" name="DELETE" />
                <input type="reset" value="RESET" name="RESET" />
            
        </form>
        <form name="retHome" action="index.jsp" method="POST">
            <input type="submit" value="BACK" name="back" />
        </form>
        
    </body>
</html>
