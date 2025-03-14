<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .table-responsive {
            margin-top: 20px;
        }
        .modal-header {
            background-color: #f8f9fa;
        }
        .btn-assign {
            background-color: #28a745;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mt-4 mb-4">Requested Bookings</h2>
        
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Mobile</th>
                        <th>Pickup Location</th>
                        <th>Drop-off Location</th>
                        <th>Vehicle Type</th>
                        <th>Price (¥)</th>
                        <th>Distance (km)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${requestedBookings}">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.customerUsername}</td>
                            <td>${booking.mobile}</td>
                            <td>${booking.pickupLocation}</td>
                            <td>${booking.dropOffLocation}</td>
                            <td>${booking.vehicleType}</td>
                            <td>${booking.price}</td>
                            <td>${booking.lengthOfRide}</td>
                            <td>
                                <button type="button" class="btn btn-assign btn-sm"
                                        onclick="openAssignModal(${booking.id}, '${booking.vehicleType}')">
                                    <i class="fas fa-user-plus"></i> Assign Rider
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- No bookings message -->
        <c:if test="${empty requestedBookings}">
            <div class="alert alert-info">
                No requested bookings available at the moment.
            </div>
        </c:if>
    </div>

    <!-- Assign Rider Modal -->
    <div class="modal fade" id="assignRiderModal" tabindex="-1" aria-labelledby="assignRiderModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="assignRiderModalLabel">Assign Rider</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="assignRiderForm" action="assign-rider" method="post">
                        <input type="hidden" id="bookingId" name="bookingId">
                        <input type="hidden" id="vehicleNumber" name="vehicleNumber">
                        
                        <div class="mb-3">
                            <label for="riderSelect" class="form-label">Select Rider:</label>
                            <select class="form-select" id="riderSelect" name="riderUsername" required>
                                <option value="" selected disabled>Loading riders...</option>
                            </select>
                        </div>
                        
                        <div class="mb-3" id="riderDetails" style="display: none;">
                            <h6>Rider Details:</h6>
                            <p><strong>Vehicle Type:</strong> <span id="vehicleType"></span></p>
                            <p><strong>Plate Number:</strong> <span id="plateNumber"></span></p>
                            <p><strong>Mobile:</strong> <span id="riderMobile"></span></p>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Assign Rider</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Function to open the assign modal and load riders
        function openAssignModal(bookingId, vehicleType) {
            // Set the booking ID to the hidden input
            document.getElementById('bookingId').value = bookingId;
            
            // Clear previous rider details
            document.getElementById('riderDetails').style.display = 'none';
            
            // Reset and show loading in dropdown
            const riderSelect = document.getElementById('riderSelect');
            riderSelect.innerHTML = '<option value="" selected disabled>Loading riders...</option>';
            
            // Fetch riders by vehicle type
            fetch('getRidersByVehicleType?vehicleType=' + encodeURIComponent(vehicleType))
                .then(response => response.json())
                .then(riders => {
                    // Clear loading option
                    riderSelect.innerHTML = '<option value="" selected disabled>Select a rider</option>';
                    
                    // Populate dropdown with riders
                    riders.forEach(rider => {
                        const option = document.createElement('option');
                        option.value = rider.username;
                        option.textContent = rider.username;
                        // Store rider details as data attributes
                        option.dataset.vehicleType = rider.vehicleType;
                        option.dataset.plateNumber = rider.plateNumber;
                        option.dataset.mobile = rider.mobile;
                        riderSelect.appendChild(option);
                    });
                    
                    // Show no riders message if needed
                    if (riders.length === 0) {
                        riderSelect.innerHTML = '<option value="" selected disabled>No available riders for this vehicle type</option>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching riders:', error);
                    riderSelect.innerHTML = '<option value="" selected disabled>Error loading riders</option>';
                });
            
            // Show the modal
            const assignModal = new bootstrap.Modal(document.getElementById('assignRiderModal'));
            assignModal.show();
        }
        
        // Update rider details when selection changes
        document.getElementById('riderSelect').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            const detailsDiv = document.getElementById('riderDetails');
            
            if (this.value) {
                // Show rider details
                document.getElementById('vehicleType').textContent = selectedOption.dataset.vehicleType;
                document.getElementById('plateNumber').textContent = selectedOption.dataset.plateNumber;
                document.getElementById('riderMobile').textContent = selectedOption.dataset.mobile;
                document.getElementById('vehicleNumber').value = selectedOption.dataset.plateNumber;
                detailsDiv.style.display = 'block';
            } else {
                // Hide details if no rider selected
                detailsDiv.style.display = 'none';
            }
        });
    </script>
</body>
</html>