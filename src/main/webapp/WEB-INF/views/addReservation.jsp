<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.model.RoomType" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<%
    String error = (String) request.getAttribute("error");
    List<RoomType> roomTypes = (List<RoomType>) request.getAttribute("roomTypes");
%>

<style>
    /* Dark Red Theme + new input layout */
    .card.pad {
        background: rgba(255,80,80,0.12);
        border: 1px solid rgba(255,80,80,0.5);
        border-radius: 16px;
        box-shadow: 0 15px 45px rgba(0,0,0,0.35);
        backdrop-filter: blur(12px);
        padding: 24px;
        transition: 0.3s ease;
    }
    .card.pad:hover {
        box-shadow: 0 20px 60px rgba(0,0,0,0.45);
    }

    .h1 { font-size: 24px; font-weight: 800; margin-bottom: 8px; color: #fff; }
    .p { color: rgba(255,200,200,0.8); margin-bottom: 16px; }

    .field label {
        display: block;
        font-size: 12px;
        color: rgba(255,180,180,0.8);
        margin-bottom: 6px;
    }

    .input, select {
        width: 100%;
        height: 44px;
        padding: 10px 12px;
        border-radius: 12px;
        border: 1px solid rgba(255,80,80,0.5);
        background: rgba(0,0,0,0.2);
        color: #fff;
        outline: none;
        transition: 0.2s;
    }
    .input:focus, select:focus {
        border-color: #ff4a4a;
        box-shadow: 0 0 0 4px rgba(255,80,80,0.2);
    }

    .actions {
        display: flex;
        gap: 10px;
        margin-top: 12px;
    }

    .btn-primary {
        background: linear-gradient(135deg, rgba(255,80,80,0.7), rgba(255,50,50,0.25));
        border-color: rgba(255,80,80,0.7);
        color: #fff;
    }
    .btn-primary:hover {
        background: linear-gradient(135deg, rgba(255,100,100,0.8), rgba(255,60,60,0.3));
        border-color: rgba(255,100,100,0.8);
    }

    .btn {
        background: rgba(255,50,50,0.15);
        border: 1px solid rgba(255,80,80,0.4);
        color: #fff;
        border-radius: 12px;
        padding: 10px 14px;
        font-weight: 600;
        transition: 0.2s;
        text-decoration: none;
    }
    .btn:hover {
        background: rgba(255,80,80,0.25);
    }

    /* New placement: staggered + full width for dates */
    .grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 16px;
    }
    .col-12.actions { grid-column: span 2; display: flex; flex-direction: column; gap: 10px; }

    @media (max-width: 700px) {
        .grid { grid-template-columns: 1fr; }
        .col-12.actions { grid-column: span 1; }
    }
</style>

<div class="card pad">
    <div class="h1">Add Reservation</div>
    <div class="p">Fill details and save the reservation.</div>

    <% if (error != null) { %>
    <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/add-reservation" style="margin-top:12px;">
        <div class="grid">
            <div class="col-6 field">
                <label>Guest Name</label>
                <input class="input" name="guestName" required>
            </div>

            <div class="col-6 field">
                <label>Phone</label>
                <input class="input" name="phone" required>
            </div>

            <div class="col-6 field">
                <label>Room Type</label>
                <select name="roomTypeId" required>
                    <option value="">-- Select Room Type --</option>
                    <% if (roomTypes != null) {
                        for (RoomType rt : roomTypes) { %>
                    <option value="<%= rt.getId() %>"><%= rt.getTypeName() %> (Rs.<%= rt.getPricePerNight() %>)</option>
                    <% }} %>
                </select>
            </div>

            <div class="col-6 field">
                <label>Check-in</label>
                <input class="input" type="date" name="checkIn" required>
            </div>

            <div class="col-6 field">
                <label>Check-out</label>
                <input class="input" type="date" name="checkOut" required>
            </div>

            <div class="col-12 actions">
                <button class="btn btn-primary" type="submit">Save Reservation</button>
                <a class="btn" href="<%= request.getContextPath() %>//dashboard">Cancel</a>
            </div>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>