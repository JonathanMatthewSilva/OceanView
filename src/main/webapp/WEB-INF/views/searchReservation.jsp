<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<%
    String q = request.getParameter("name");
    List<Reservation> results = (List<Reservation>) request.getAttribute("results");
%>

<div class="card pad" style="background:#330000; border:1px solid #990000; border-radius:12px; padding:20px; margin-bottom:20px;">
    <div class="h1" style="color:#ff9999; margin-bottom:12px;">Search Reservation</div>
    <div class="p" style="color:#ffcccc; margin-bottom:16px;">Search by guest name and view results.</div>

    <form method="get" action="<%= request.getContextPath() %>/search-reservation" style="margin-top:12px;">
        <div class="grid" style="display:grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap:16px;">
            <div class="field">
                <label style="color:#ffcccc; display:block; margin-bottom:4px;">Guest Name</label>
                <input class="input" name="name" value="<%= (q != null ? q : "") %>" placeholder="e.g., Henry" required>
            </div>
            <div class="field" style="display:flex; flex-direction:column; gap:10px; justify-content:flex-end;">
                <button class="btn btn-primary" type="submit" style="background:#990000; color:#fff;">Search</button>
                <a class="btn" href="<%= request.getContextPath() %>/search-reservation" style="background:#660000; color:#fff; text-align:center;">Clear</a>
            </div>
        </div>
    </form>

    <div style="height:12px;"></div>

    <% if (q != null) { %>
    <div class="p" style="color:#ffcccc; margin-bottom:8px;">
        Showing results for: <span class="badge" style="background:#990000; color:#fff;"><%= q %></span>
    </div>

    <div class="table-wrap" style="overflow-x:auto; border-radius:12px; border:1px solid #990000; margin-top:12px;">
        <table style="width:100%; border-collapse:collapse; min-width:600px; background:#330000; color:#ffcccc;">
            <tr style="background:#990000; color:#fff;">
                <th>ID</th><th>Guest</th><th>Phone</th><th>Room</th>
                <th>Check-in</th><th>Check-out</th><th>Nights</th><th>Total</th>
            </tr>

            <% if (results != null && !results.isEmpty()) {
                for (Reservation r : results) { %>
            <tr>
                <td><%= r.getId() %></td>
                <td><%= r.getGuestName() %></td>
                <td><%= r.getPhone() %></td>
                <td><%= r.getRoomTypeName() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td><%= r.getNights() %></td>
                <td><%= r.getTotal() %></td>
            </tr>
            <% }} else { %>
            <tr><td colspan="8">No results found.</td></tr>
            <% } %>
        </table>
    </div>
    <% } %>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>