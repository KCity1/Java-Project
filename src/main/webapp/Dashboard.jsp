<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <!-- Sidebar -->
  <div class="d-flex">
    <div class="sidebar bg-dark text-white p-3" style="width: 220px; height: 100vh; position: fixed;">
      <h4 class="text-center">eCampus</h4>
      <ul class="nav flex-column mt-4">
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-home"></i> Dashboard</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-book"></i> Courses</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-chalkboard-teacher"></i> Faculties</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-user"></i> Students</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-check-square"></i> Fill Attendance</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-eye"></i> View Attendance</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="#"><i class="fas fa-users"></i> Batches</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="content p-4" style="margin-left: 220px;">
      <div class="container">
        <h2 class="text-white">Welcome, <%= request.getParameter("username") %></h2>

        <!-- Chart Section -->
        <div class="chart bg-dark text-white p-4 rounded mb-4" style="height: 300px;">
          <canvas id="dashboardChart"></canvas>
        </div>

        <!-- Stats Cards -->
        <div class="row">
          <div class="col-md-4">
            <div class="card text-white bg-dark mb-3">
              <div class="card-body">
                <h5 class="card-title">Progress Stats</h5>
                <p class="card-text">Detailed progress stats go here.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-dark mb-3">
              <div class="card-body">
                <h5 class="card-title">Activity Stats</h5>
                <p class="card-text">Detailed activity stats go here.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card text-white bg-dark mb-3">
              <div class="card-body">
                <h5 class="card-title">Sales Stats</h5>
                <p class="card-text">Detailed sales stats go here.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Example Chart.js Configuration
    const ctx = document.getElementById('dashboardChart').getContext('2d');
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [{
          label: 'Performance',
          data: [12, 19, 3, 5, 2, 3, 7],
          borderColor: 'rgba(255, 99, 132, 1)',
          backgroundColor: 'rgba(255, 99, 132, 0.2)'
        }z]
      },
      options: {
        responsive: true
      }
    });
  </script>
</body>
</html>
