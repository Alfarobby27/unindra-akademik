<?php
session_start();

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../login.php");
    exit();
}

require_once '../koneksi.php';

// Get admin info
$user_id = $_SESSION['user_id'];
$user_query = mysqli_query($conn, "SELECT * FROM users WHERE id = '$user_id'");
$user = mysqli_fetch_assoc($user_query);

// Get mahasiswa
$mahasiswa_result = mysqli_query($conn, 
    "SELECT m.*, ps.nama as program_studi_nama 
     FROM mahasiswa m 
     LEFT JOIN program_studi ps ON m.program_studi_id = ps.id 
     ORDER BY m.created_at DESC");

$mahasiswa_data = [];
while ($row = mysqli_fetch_assoc($mahasiswa_result)) {
    $mahasiswa_data[] = [
        'id' => $row['id'],
        'user_id' => $row['user_id'],
        'nim' => $row['nim'],
        'nama' => $row['nama'],
        'email' => $row['email'],
        'program_studi_id' => $row['program_studi_id'],
        'program_studi' => $row['program_studi_nama'] ?? 'Belum ditentukan',
        'semester' => $row['semester'],
        'status' => $row['status'] ?? 'Aktif'
    ];
}

// Get program studi
$prodi_list = [];
$prodi_result = mysqli_query($conn, "SELECT id, nama FROM program_studi ORDER BY nama");
while ($row = mysqli_fetch_assoc($prodi_result)) {
    $prodi_list[] = $row;
}

// Handle form
$message = '';
$message_type = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';
    
    if ($action === 'add') {
        $nim = trim(mysqli_real_escape_string($conn, $_POST['nim']));
        $nama = trim(mysqli_real_escape_string($conn, $_POST['nama']));
        $email = trim(mysqli_real_escape_string($conn, $_POST['email']));
        $program_studi_id = (int) $_POST['program_studi'];
        $semester = (int) $_POST['semester'];
        $status = trim(mysqli_real_escape_string($conn, $_POST['status']));
        $password = password_hash($nama, PASSWORD_DEFAULT);

        $cek = mysqli_query($conn, "SELECT id FROM users WHERE username = '$nim' OR email = '$email'");
        if (mysqli_num_rows($cek) > 0) {
            $message = "NIM atau Email sudah digunakan!";
            $message_type = 'danger';
        } else {
            $insert_user = mysqli_query($conn, 
                "INSERT INTO users (username, password, role, full_name, email) 
                 VALUES ('$nim', '$password', 'mahasiswa', '$nama', '$email')");

            if ($insert_user) {
                $user_id = mysqli_insert_id($conn);
                $insert_mhs = mysqli_query($conn, 
                    "INSERT INTO mahasiswa (user_id, nim, nama, program_studi_id, semester, email, status) 
                     VALUES ($user_id, '$nim', '$nama', $program_studi_id, $semester, '$email', '$status')");
                if ($insert_mhs) {
                    $message = "Mahasiswa berhasil ditambahkan!";
                    $message_type = 'success';
                } else {
                    $message = "Gagal menambahkan mahasiswa: " . mysqli_error($conn);
                    $message_type = 'danger';
                }
            } else {
                $message = "Gagal menambahkan user: " . mysqli_error($conn);
                $message_type = 'danger';
            }
        }

    } elseif ($action === 'edit') {
        $mhs_id = (int) $_POST['mahasiswa_id'];
        $nim = trim(mysqli_real_escape_string($conn, $_POST['nim']));
        $nama = trim(mysqli_real_escape_string($conn, $_POST['nama']));
        $email = trim(mysqli_real_escape_string($conn, $_POST['email']));
        $program_studi_id = (int) $_POST['program_studi'];
        $semester = (int) $_POST['semester'];
        $status = trim(mysqli_real_escape_string($conn, $_POST['status']));
        $password = password_hash($nama, PASSWORD_DEFAULT);

        $update_mhs = mysqli_query($conn, 
            "UPDATE mahasiswa SET 
             nim = '$nim', 
             nama = '$nama', 
             email = '$email', 
             program_studi_id = $program_studi_id, 
             semester = $semester, 
             status = '$status' 
             WHERE id = $mhs_id");

        if ($update_mhs) {
            $user_result = mysqli_query($conn, "SELECT user_id FROM mahasiswa WHERE id = $mhs_id");
            $user_data = mysqli_fetch_assoc($user_result);
            if ($user_data && $user_data['user_id']) {
                mysqli_query($conn, 
                    "UPDATE users SET username = '$nim', password = '$password', full_name = '$nama', email = '$email' 
                     WHERE id = {$user_data['user_id']}");
            }

            $message = "Data mahasiswa berhasil diperbarui!";
            $message_type = 'success';
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();

        } else {
            $message = "Gagal memperbarui data: " . mysqli_error($conn);
            $message_type = 'danger';
        }

    } elseif ($action === 'delete') {
        $mhs_id = (int) $_POST['mahasiswa_id'];
        $get_user = mysqli_query($conn, "SELECT user_id FROM mahasiswa WHERE id = $mhs_id");
        $user_data = mysqli_fetch_assoc($get_user);

        $delete_mhs = mysqli_query($conn, "DELETE FROM mahasiswa WHERE id = $mhs_id");
        if ($delete_mhs) {
            if ($user_data && $user_data['user_id']) {
                mysqli_query($conn, "DELETE FROM users WHERE id = {$user_data['user_id']}");
            }
            $message = "Mahasiswa berhasil dihapus!";
            $message_type = 'success';
            header("Location: " . $_SERVER['PHP_SELF']);
            exit();
        } else {
            $message = "Gagal menghapus data: " . mysqli_error($conn);
            $message_type = 'danger';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelola Mahasiswa - Universitas Indraprasta PGRI</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
        }

        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 0;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.2);
            animation: modalSlideIn 0.3s ease-out;
        }

        .modal-header {
            padding: 1.5rem 2rem;
            background: linear-gradient(135deg, #0f2027 0%, #8bd2f2 100%);
            color: white;
            border-radius: 12px 12px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h3 {
            margin: 0;
            font-size: 1.25rem;
            font-weight: 600;
        }

        .close {
            color: white;
            font-size: 2rem;
            font-weight: bold;
            cursor: pointer;
            line-height: 1;
            opacity: 0.7;
            transition: opacity 0.2s;
        }

        .close:hover {
            opacity: 1;
        }

        .modal-body {
            padding: 2rem;
        }

        .modal-footer {
            padding: 1.5rem 2rem;
            background: #f8fafc;
            border-radius: 0 0 12px 12px;
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            border-top: 1px solid #e5e7eb;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .detail-item label {
            font-weight: 600;
            color: #374151;
            font-size: 0.875rem;
        }

        .detail-item span {
            color: #6b7280;
            font-size: 0.95rem;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @media (max-width: 768px) {
            .modal-content {
                width: 95%;
                margin: 2% auto;
            }

            .detail-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .modal-footer {
                flex-direction: column;
            }

            .modal-footer .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <?php include 'includes/nav_admin.php'; ?>

    <main>
        <div class="dashboard-container">
            <div class="dashboard-header">
                <h1><i class="fas fa-users"></i> Kelola Mahasiswa</h1>
                <p>Manajemen data mahasiswa dan informasi akademik</p>
            </div>

            <?php if ($message): ?>
                <div class="alert alert-<?php echo $message_type; ?>">
                    <i class="fas fa-check-circle"></i>
                    <?php echo $message; ?>
                </div>
            <?php endif; ?>

            <!-- Add Student Form -->
            <div class="dashboard-section">
                <h2><i class="fas fa-user-plus"></i> Tambah Mahasiswa Baru</h2>
                <div class="form-container">
                    <form method="POST" class="student-form">
                        <input type="hidden" name="action" value="add">
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="nim">NIM</label>
                                <input type="text" id="nim" name="nim" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="nama">Nama Lengkap</label>
                                <input type="text" id="nama" name="nama" class="form-control" required>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="program_studi">Program Studi</label>
                                <select id="program_studi" name="program_studi" class="form-control" required>
                                    <option value="">Pilih Program Studi</option>
                                    <?php foreach ($prodi_list as $prodi): ?>
                                        <option value="<?php echo $prodi['id']; ?>"><?php echo htmlspecialchars($prodi['nama']); ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group">
                                <label for="semester">Semester</label>
                                <select id="semester" name="semester" class="form-control" required>
                                    <option value="">Pilih Semester</option>
                                    <?php for($i = 1; $i <= 8; $i++): ?>
                                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                                    <?php endfor; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" class="form-control" required>
                                    <option value="">Pilih Status</option>
                                    <option value="Aktif">Aktif</option>
                                    <option value="Cuti">Cuti</option>
                                    <option value="Non-Aktif">Non-Aktif</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-plus"></i> Tambah Mahasiswa
                            </button>
                            <button type="button" class="btn btn-secondary" onclick="resetForm()">
                                <i class="fas fa-undo"></i> Reset
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Students List -->
            <div class="dashboard-section">
                <h2><i class="fas fa-list"></i> Daftar Mahasiswa</h2>
                <div class="table-container">
                    <div class="table-responsive">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>NIM</th>
                                    <th>Nama</th>
                                    <th>Email</th>
                                    <th>Program Studi</th>
                                    <th>Semester</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($mahasiswa_data as $mhs): ?>
                                    <tr>
                                        <td><?php echo $mhs['nim']; ?></td>
                                        <td><?php echo $mhs['nama']; ?></td>
                                        <td><?php echo $mhs['email']; ?></td>
                                        <td><?php echo $mhs['program_studi']; ?></td>
                                        <td><?php echo $mhs['semester']; ?></td>
                                        <td>
                                            <span class="badge badge-<?php echo strtolower($mhs['status']); ?>">
                                                <?php echo $mhs['status']; ?>
                                            </span>
                                        </td>
                                        <td>
                                            <div class="action-buttons">
                                                <button class="btn btn-sm btn-info" onclick="viewStudent(<?php echo $mhs['id']; ?>)">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                                <button class="btn btn-sm btn-warning" onclick="editStudent(<?php echo $mhs['id']; ?>)">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-sm btn-danger" onclick="deleteStudent(<?php echo $mhs['id']; ?>)">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- View Mahasiswa Modal -->
            <div id="viewModal" class="modal">
              <div class="modal-content">
                <div class="modal-header">
                  <h3><i class="fas fa-user"></i> Detail Mahasiswa</h3>
                  <span class="close" onclick="closeModal('viewModal')">&times;</span>
                </div>
                <div class="modal-body">
                  <div class="detail-grid">
                    <div class="detail-item"><label>NIM:</label><span id="viewNim"></span></div>
                    <div class="detail-item"><label>Nama Lengkap:</label><span id="viewNama"></span></div>
                    <div class="detail-item"><label>Email:</label><span id="viewEmail"></span></div>
                    <div class="detail-item"><label>Program Studi:</label><span id="viewProdi"></span></div>
                    <div class="detail-item"><label>Semester:</label><span id="viewSemester"></span></div>
                    <div class="detail-item"><label>Status:</label><span id="viewStatus" class="badge"></span></div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-secondary" onclick="closeModal('viewModal')">Tutup</button>
                </div>
              </div>
            </div>

            <!-- Edit Mahasiswa Modal -->
            <div id="editModal" class="modal">
              <div class="modal-content">
                <div class="modal-header">
                  <h3><i class="fas fa-edit"></i> Edit Mahasiswa</h3>
                  <span class="close" onclick="closeModal('editModal')">&times;</span>
                </div>
                <div class="modal-body">
                  <form method="POST" id="editForm">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="mahasiswa_id" id="editMahasiswaId">

                    <div class="form-row">
                      <div class="form-group">
                        <label for="editNim">NIM</label>
                        <input type="text" id="editNim" name="nim" class="form-control" required>
                      </div>
                      <div class="form-group">
                        <label for="editNama">Nama Lengkap</label>
                        <input type="text" id="editNama" name="nama" class="form-control" required>
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="form-group">
                        <label for="editEmail">Email</label>
                        <input type="email" id="editEmail" name="email" class="form-control" required>
                      </div>
                      <div class="form-group">
                        <label for="editProgramStudi">Program Studi</label>
                        <select id="editProgramStudi" name="program_studi" class="form-control" required>
                          <?php foreach ($prodi_list as $prodi): ?>
                            <option value="<?= $prodi['id']; ?>"><?= htmlspecialchars($prodi['nama']); ?></option>
                          <?php endforeach; ?>
                        </select>
                      </div>
                    </div>
                        
                    <div class="form-row">
                      <div class="form-group">
                        <label for="editSemester">Semester</label>
                        <select id="editSemester" name="semester" class="form-control" required>
                          <?php for ($i = 1; $i <= 8; $i++): ?>
                            <option value="<?= $i; ?>"><?= $i; ?></option>
                          <?php endfor; ?>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="editStatus">Status</label>
                        <select id="editStatus" name="status" class="form-control" required>
                          <option value="Aktif">Aktif</option>
                          <option value="Cuti">Cuti</option>
                          <option value="Non-Aktif">Non-Aktif</option>
                        </select>
                      </div>
                    </div>
                  </form>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-secondary" onclick="closeModal('editModal')">Batal</button>
                  <button class="btn btn-primary" onclick="document.getElementById('editForm').submit()">
                    <i class="fas fa-save"></i> Simpan Perubahan
                  </button>
                </div>
              </div>
            </div>            
    </div>

    <?php include '../includes/footer.php'; ?>

    <script>
        function viewStudent(id) {
            const mahasiswa = <?php echo json_encode($mahasiswa_data); ?>.find(m => m.id == id);
            if (mahasiswa) {
                document.getElementById('viewNim').textContent = mahasiswa.nim;
                document.getElementById('viewNama').textContent = mahasiswa.nama;
                document.getElementById('viewEmail').textContent = mahasiswa.email;
                document.getElementById('viewProdi').textContent = mahasiswa.program_studi;
                document.getElementById('viewSemester').textContent = mahasiswa.semester;
                document.getElementById('viewStatus').textContent = mahasiswa.status;
                document.getElementById('viewStatus').className = 'badge badge-' + mahasiswa.status.toLowerCase();
                document.getElementById('viewModal').style.display = 'block';
            }
        }
        
        function editStudent(id) {
            const mahasiswa = <?php echo json_encode($mahasiswa_data); ?>.find(m => m.id == id);
            if (mahasiswa) {
                document.getElementById('editMahasiswaId').value = mahasiswa.id;
                document.getElementById('editNim').value = mahasiswa.nim;
                document.getElementById('editNama').value = mahasiswa.nama;
                document.getElementById('editEmail').value = mahasiswa.email;
                document.getElementById('editProgramStudi').value = mahasiswa.program_studi_id ?? '';
                document.getElementById('editSemester').value = mahasiswa.semester;
                document.getElementById('editStatus').value = mahasiswa.status;
                document.getElementById('editModal').style.display = 'block';
            }
        }
        
        function deleteStudent(id) {
            if (confirm('Apakah Anda yakin ingin menghapus mahasiswa ini?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.style.display = 'none';
            
                const inputAction = document.createElement('input');
                inputAction.name = 'action';
                inputAction.value = 'delete';
                form.appendChild(inputAction);
            
                const inputId = document.createElement('input');
                inputId.name = 'mahasiswa_id';
                inputId.value = id;
                form.appendChild(inputId);
            
                document.body.appendChild(form);
                form.submit();
            }
        }
        
        function resetForm() {
            document.querySelector('.student-form').reset();
        }
        

        // Close modal when clicking outside
        window.onclick = function(event) {
            const viewModal = document.getElementById('viewModal');
            const editModal = document.getElementById('editModal');
            
            if (event.target === viewModal) {
                viewModal.style.display = 'none';
            }
            if (event.target === editModal) {
                editModal.style.display = 'none';
            }
        }

        // ✅ Fungsi ini HARUS di luar DOMContentLoaded agar bisa diakses dari onclick HTML
function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
        modal.style.display = 'none';
    }
}

// Baru di bawahnya boleh pakai DOMContentLoaded
document.addEventListener('DOMContentLoaded', function () {
    const viewButtons = document.querySelectorAll('.view-btn');
    const deleteButtons = document.querySelectorAll('.delete-btn');

    viewButtons.forEach(button => {
        button.addEventListener('click', function () {
            const student = JSON.parse(this.getAttribute('data-student'));
            viewStudent(student);
        });
    });

    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            const student = JSON.parse(this.getAttribute('data-student'));
            deleteStudent(student);
        });
    });

    function viewStudent(student) {
        const modal = document.getElementById('modalDetailMahasiswa');
        modal.style.display = 'flex';
        // Set isi detail
        document.getElementById('detailNIM').textContent = student.nim;
        document.getElementById('detailNama').textContent = student.nama;
        document.getElementById('detailEmail').textContent = student.email;
        document.getElementById('detailAlamat').textContent = student.alamat;
    }

    function deleteStudent(student) {
        const confirmation = confirm(`Apakah Anda yakin ingin menghapus mahasiswa dengan NIM ${student.nim}?`);
        if (confirmation) {
            window.location.href = `hapus_mahasiswa.php?nim=${student.nim}`;
        }
    }
});


        // Auto-hide alerts after 5 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                setTimeout(function() {
                    alert.style.opacity = '0';
                    setTimeout(function() {
                        alert.style.display = 'none';
                    }, 300);
                }, 5000);
            });
        });
    </script>
</body>
</html>