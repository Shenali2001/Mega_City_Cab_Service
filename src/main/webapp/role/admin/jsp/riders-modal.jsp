<div id="ridersModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">×</span>
        <h2>Assign Rider</h2>
        <form action="${pageContext.request.contextPath}/assignRider" method="post">
            <input type="hidden" id="bookingId" name="bookingId" value="">
            <label for="ridersDropdown">Select Rider:</label>
            <select id="ridersDropdown" name="riderId" required>
                <option value="-1">Select a rider</option>
            </select><br>
            <button type="button" onclick="assignRider()" class="btn-basic">Assign</button>
        </form>
    </div>
</div>

<script>
    function closeModal() {
        document.getElementById("ridersModal").style.display = "none";
    }
</script>