<%@ include file='header.jsp' %>








<div class="container">
  <!-- ===== SECTION HERO ===== -->
  <div class="row align-items-center" style="min-height:80vh;padding:40px 0;">
    <div class="col-lg-6" style="padding-right:40px;">
      <div class="hero-content">
        <h1 class="display-4 fw-bold" style="color:#2c3e50;margin-bottom:20px;line-height:1.2;">
          Creez des <br><span style="background:linear-gradient(135deg,#8e44ad,#3498db);-webkit-background-clip:text;-webkit-text-fill-color:transparent;">moments inoubliables</span>
        </h1>
        <p style="font-size:1.1rem;color:var(--text);line-height:1.8;max-width:90%;background:transparent;">
          Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo, repellendus et molestias in placeat mollitia similique impedit perferendis ipsa ipsum necessitatibus possimus adipisci, numquam at! Ipsam ducimus nobis officia fugit.
        </p>
        <div style="margin-top:40px;display:flex;gap:15px;flex-wrap:wrap;">
          <a href="DescriptionServlet" class="btn btn-primary btn-lg" style="border-radius:50px;padding:14px 40px;font-weight:600;background:linear-gradient(135deg,#8e44ad,#6c3483);border:none;box-shadow:0 8px 25px rgba(142,68,173,0.4);transition:0.3s;">
            Reserver maintenant <i class="fa fa-arrow-right ms-2"></i>
          </a>
          <a href="AjoutVoyage.jsp" class="btn btn-outline-secondary btn-lg" style="border-radius:50px;padding:14px 35px;font-weight:500;border-color:#ddd;color:var(--text);">
            Voir les reservations
          </a>
        </div>
        <!-- Statistiques -->
        <div style="display:flex;gap:40px;margin-top:50px;border-top:1px solid #eee;padding-top:30px;">
          <div>
            <h3 style="font-size:2rem;font-weight:700;color:#8e44ad;margin:0;">50+</h3>
            <p style="color:#7f8c8d;font-size:0.9rem;margin:0;">Ev�nements organisés</p>
          </div>
          <div>
            <h3 style="font-size:2rem;font-weight:700;color:#3498db;margin:0;">98%</h3>
            <p style="color:#7f8c8d;font-size:0.9rem;margin:0;">Satisfaction client</p>
          </div>
          <div>
            <h3 style="font-size:2rem;font-weight:700;color:#2ecc71;margin:0;">24/7</h3>
            <p style="color:#7f8c8d;font-size:0.9rem;margin:0;">Support disponible</p>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-6" style="position:relative;">
      <div class="image-wrapper" style="position:relative;display:flex;justify-content:center;align-items:center;">
        <!-- Carte principale -->
        <div style="border-radius:20px;overflow:hidden;box-shadow:0 20px 60px rgba(142,68,173,0.25);position:relative;width:100%;max-width:500px;">
          <img src="img/img1_1.jpg" class="img-fluid" alt="Espace Fête" style="width:100%;height:400px;object-fit:cover;display:block;">
          <!-- Badge flottant -->
          <div style="position:absolute;top:20px;right:20px;background:rgba(255,255,255,0.95);backdrop-filter:blur(10px);padding:10px 18px;border-radius:12px;box-shadow:0 4px 15px rgba(0,0,0,0.1);">
            <span style="display:flex;align-items:center;gap:8px;font-size:0.85rem;font-weight:600;color:#2c3e50;">
              <span style="display:inline-block;width:10px;height:10px;background:#2ecc71;border-radius:50%;animation:pulse-dot 1.5s infinite;"></span>
              Disponible
            </span>
          </div>
        </div>
        <!-- Carte flottante décorative -->
        <div style="position:absolute;bottom:-20px;left:-20px;background:white;padding:15px 25px;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,0.08);display:flex;align-items:center;gap:15px;border:1px solid #f0f0f0;">
          <i class="fa-solid fa-star" style="color:#f1c40f;font-size:1.2rem;"></i>
          <div>
            <div style="font-weight:700;color:#2c3e50;font-size:0.9rem;">4.9 / 5.0</div>
            <div style="font-size:0.8rem;color:#7f8c8d;">Avis clients</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ===== SECTION RÉSERVATIONS ===== -->
  <div id="reservations" style="padding:60px 0 80px 0;border-top:1px solid #eee;">
    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:30px;flex-wrap:wrap;gap:15px;">
      <div>
        <h2 style="font-weight:700;color:#2c3e50;margin:0;">
          R�servations <span style="color:#3498db;">actuelles</span>
        </h2>
        <p style="color:#7f8c8d;margin:5px 0 0 0;">Liste des r�servations en cours</p>
      </div>
      <span class="badge" style="background:#ecf0f1;color:#2c3e50;padding:8px 18px;border-radius:30px;font-size:0.9rem;">
        <i class="fa-regular fa-calendar me-1"></i> 
      </span>
    </div>

    <div style="background:var(--card);border-radius:20px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.04);border:1px solid #f0f0f0;">
      <div style="overflow-x:auto;">
        <table style="width:100%;border-collapse:collapse;min-width:500px;">
          <thead>
            <tr style="background:linear-gradient(135deg,#8e44ad,#6c3483);color:#fff;">
              <th style="padding:18px 20px;text-align:left;font-weight:600;font-size:0.9rem;letter-spacing:0.5px;">
                <i class="fa-regular fa-user me-2"></i> id Client
              </th>
              <th style="padding:18px 20px;text-align:left;font-weight:600;font-size:0.9rem;letter-spacing:0.5px;">
                <i class="fa-regular fa-calendar-plus me-2"></i> Date d'entrée
              </th>
              <th style="padding:18px 20px;text-align:left;font-weight:600;font-size:0.9rem;letter-spacing:0.5px;">
                <i class="fa-regular fa-calendar-minus me-2"></i> Date de sortie
              </th>
              <th style="padding:18px 20px;text-align:left;font-weight:600;font-size:0.9rem;letter-spacing:0.5px;">
                <i class="fa-regular fa-clock me-2"></i> Statut
              </th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </div>
    
    <!-- Indicateur de mise à jour -->
    <div style="text-align:right;margin-top:12px;font-size:0.8rem;color:#95a5a6;">
      <i class="fa-regular fa-rotate-right me-1"></i> Dernière mise à jour : <?php echo date('d/m/Y H:i'); ?>
    </div>
  </div>
</div>

<!-- Animation CSS pour le dot -->
<style>
  @keyframes pulse-dot {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.5; transform: scale(0.8); }
  }
  
  /* Hover sur les lignes du tableau */
  table tbody tr:hover {
    background: rgba(142, 68, 173, 0.04);
    cursor: default;
  }
  
  /* Responsive */
  @media (max-width: 992px) {
    .hero-content {
      text-align: center;
      padding: 0 15px;
    }
    .hero-content p {
      max-width: 100%;
      margin: 0 auto;
    }
    .hero-content .d-flex {
      justify-content: center;
    }
    .hero-content .statistiques {
      justify-content: center;
    }
  }
  
  @media (max-width: 576px) {
    .hero-content h1 {
      font-size: 2rem !important;
    }
    .hero-content .display-4 {
      font-size: 2.2rem;
    }
    .hero-content .btn-lg {
      padding: 12px 28px !important;
      font-size: 0.95rem;
    }
    .image-wrapper .floating-card {
      display: none;
    }
  }
</style>










<%@ include file='footer.jsp' %>

