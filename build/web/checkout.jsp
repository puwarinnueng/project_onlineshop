

<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.QuantityTable"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.Quantity"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
    </head>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: aquamarine;
        }
    </style>

    <jsp:useBean id="quantity" class="model.Quantity" scope="request"/>
    <%
        List<Quantity> quantity = QuantityTable.findAllQuantity();
        Iterator<Quantity> itr = quantity.iterator();
    %>

    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Rate</th>
                    <th>Years</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>    
            <tbody>
                <%
                    int i = 1;
                    while (itr.hasNext()) {
                        quantity = itr.next();
                        out.println("<tr>");
                        out.println("<td> " + (i++) + "</td>");
                        out.println("<td> " + quantity.getIdCart().getName() + "</td>");
                        out.println("<td> " + quantity.getIdCart().getRate() + "</td>");
                        out.println("<td> " + quantity.getIdCart().getYears() + "</td>");
                        out.println("<td> " + quantity.getIdCart().getPrice() + "</td>");
                        out.println("<td> " + quantity.getQuantity() + "</td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>

        <h4 class="text-center" style="margin-left:60px; margin-top: 20px"><%= "The total amount is $" + request.getAttribute("totalAmount")%></h4>
    </div>
    <hr>



</div>
</body>
</html>
