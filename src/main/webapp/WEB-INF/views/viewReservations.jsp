<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<%
    String success = request.getParameter("success");
    List<Reservation> list = (List<Reservation>) request.getAttribute("reservations");
%>

<div class="card pad" style="background:#330000; border:1px solid #990000; border-radius:12px; padding:20px; margin-bottom:20px;">
    <div class="h1" style="color:#ff9999; margin-bottom:12px;">All Reservations</div>
    <div class="p" style="color:#ffcccc; margin-bottom:16px;">Manage reservations, print bills, edit or delete.</div>

    <% if ("added".equals(success)) { %>
    <div class="alert alert-success" style="background:#660000; color:#fff; padding:8px 12px; border-radius:8px;">✅ Reservation added successfully!</div>
    <% } else if ("updated".equals(success)) { %>
    <div class="alert alert-success" style="background:#660000; color:#fff; padding:8px 12px; border-radius:8px;">✅ Reservation updated successfully!</div>
    <% } else if ("deleted".equals(success)) { %>
    <div class="alert alert-success" style="background:#660000; color:#fff; padding:8px 12px; border-radius:8px;">✅ Reservation deleted successfully!</div>
    <% } %>

    <div class="actions" style="margin-top:10px; display:flex; gap:10px; flex-wrap:wrap;">
        <a class="btn btn-primary" href="<%= request.getContextPath() %>/add-reservation" style="background:#990000; color:#fff;">+ Add Reservation</a>
        <a class="btn" href="<%= request.getContextPath() %>/search-reservation" style="background:#660000; color:#fff;">Search</a>
    </div>

    <div style="height:12px;"></div>

    <div class="table-wrap" style="overflow-x:auto; border-radius:12px; border:1px solid #990000;">
        <table style="width:100%; border-collapse:collapse; min-width:700px; background:#330000; color:#ffcccc;">
            <tr style="background:#990000; color:#fff;">
                <th>ID</th><th>Guest</th><th>Phone</th><th>Room</th>
                <th>Check-in</th><th>Check-out</th><th>Nights</th><th>Total</th><th>Actions</th>
            </tr>

            <% if (list != null) {
                for (Reservation r : list) { %>
            <tr>
                <td><%= r.getId() %></td>
                <td><%= r.getGuestName() %></td>
                <td><%= r.getPhone() %></td>
                <td><%= r.getRoomTypeName() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td><%= r.getNights() %></td>
                <td><%= r.getTotal() %></td>
                <td class="actions" style="display:flex; gap:6px; flex-wrap:wrap;">
                    <a class="btn" href="<%= request.getContextPath() %>/edit-reservation?id=<%= r.getId() %>" style="background:#660000; color:#fff;">Edit</a>
                    <a class="btn btn-primary" href="<%= request.getContextPath() %>/print-bill?id=<%= r.getId() %>" style="background:#990000; color:#fff;">Bill</a>
                    <a class="btn btn-danger"
                       href="<%= request.getContextPath() %>/delete-reservation?id=<%= r.getId() %>"
                       onclick="return confirm('Delete this reservation?');" style="background:#cc0000; color:#fff;">Delete</a>
                </td>
            </tr>
            <% }} %>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>