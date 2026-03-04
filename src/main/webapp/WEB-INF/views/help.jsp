<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<style>
    /* Dark Red Theme for Help Page */
    .card.pad {
        background: rgba(255,80,80,0.12);
        border: 1px solid rgba(255,80,80,0.5);
        border-radius: 16px;
        box-shadow: 0 15px 45px rgba(0,0,0,0.35);
        backdrop-filter: blur(12px);
        padding: 24px;
        margin-bottom: 18px;
        transition: 0.3s ease;
    }
    .card.pad:hover {
        box-shadow: 0 20px 60px rgba(0,0,0,0.45);
    }

    .h1 { font-size: 24px; font-weight: 800; margin-bottom: 8px; color: #fff; }
    .h3 { font-size: 18px; font-weight: 700; margin-bottom: 10px; color: #fff; }
    .p, li, ol, ul { color: rgba(255,200,200,0.8); }

    ol, ul {
        margin-left: 20px;
        padding-left: 0;
    }

    li {
        margin-bottom: 6px;
    }

    /* Grid layout for boxes */
    .help-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 16px;
    }

    @media (max-width: 700px) {
        .help-grid { grid-template-columns: 1fr; }
    }
</style>

<div class="help-grid">
    <div class="card pad">
        <div class="h1">System Help Guide</div>
        <div class="p">Welcome to Ocean View Resort Reservation System.</div>
    </div>

    <div class="card pad">
        <h3>How To Use The System</h3>

        <ol>
            <li><b>Login:</b> Enter your assigned username and password.</li>
            <li><b>Add Reservation:</b> Click “Add Reservation” and fill guest details correctly.</li>
            <li><b>View Reservations:</b> See all existing bookings.</li>
            <li><b>Search Reservation:</b> Search using reservation ID.</li>
            <li><b>Generate Reports:</b> View income and booking statistics.</li>
            <li><b>Logout:</b> Always logout after finishing work.</li>
        </ol>
    </div>

    <div class="card pad">
        <h3>Important Notes</h3>
        <ul>
            <li>All fields must be filled correctly.</li>
            <li>Reservation number must be unique.</li>
            <li>System automatically calculates total income.</li>
        </ul>
    </div>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>