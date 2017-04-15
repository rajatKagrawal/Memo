<%-- 
    Document   : index
    Created on : 14 Apr, 2017, 8:50:00 PM
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
    <body bgcolor="#e3f2fd">
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
                    inst=conn.prepareStatement("INSERT INTO memo(sub,content) VALUES(?,?)");
                    }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            

             public int setMemo(String roll,String name)
            {
                int result=0;
                try{
                    inst.setString(1,roll);
                    inst.setString(2,name);
                    result=inst.executeUpdate();
                }
                catch(Exception e){
                        e.printStackTrace();
                    }
                return result;
            }

            public ResultSet showMemo()
            {
               try{
               inst=conn.prepareStatement("select * from memo");
               res=inst.executeQuery();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                return res;
            }


            }
            %>
        
            <%
                int result;
                String sub,text;
                if(request.getParameter("SUBMIT")!=null)
            {
             
                text=new String();
                 sub=new String();
            if(request.getParameter("sub")!=null){
            sub=request.getParameter("sub");
            }
            if(request.getParameter("cont")!=null){
            text=request.getParameter("cont");
            }
            memo add=new memo();
            result=add.setMemo(sub,text);
            }
                memo a=new memo();
                ResultSet res=a.showMemo();
               // memo a=new memo();
                //a.setMemo("tyurp","gsdfdsjfgajdgsdhghfsgdsdagkffhsdhgff");
                %>
        
        <h1>Hello World!</h1>
        
        <table border="1">
            <thead>
                <tr>
                    <th>SUB</th>
                    <th>TEXT</th>
                </tr>
            </thead>
            <tbody>
                <%  while(res.next()){ %>
                <tr>
                    <td><%=res.getString("sub")%></td>
                    <td><%=res.getString("content")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>

        
        
        
        <form action="set.jsp" method="POST">
           <input type="submit" value="CREATE" name="btn" />
        </form>
        <form action="del.jsp" method="POST">
           <input type="submit" value="DELETE" name="delbtn" />
        </form>
    </body>
</html>
