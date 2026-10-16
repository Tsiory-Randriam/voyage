<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Voyage Agences Django Tranche</title>
  <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
  <script src="style/bootstrap/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/darck.css">
  <link rel="stylesheet" href="style/fontawesome-free-7.2.0-web/css/all.min.css">
  <script src="style/fontawesome-free-7.2.0-web/js/all.min.js"></script>
  <!-- Google Fonts pour un style plus moderne -->
  <link href="https://fonts.googleapis.com/css2?family=Island+Moments&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<%
    String login = request.getParameter("login");
%>


<body>
  <!-- ===== HEADER MODERNIS� ===== -->
  <header style="position:sticky;top:0;z-index:1050;background:var(--bg);border-bottom:1px solid rgba(0,0,0,0.06);backdrop-filter:blur(10px);transition:all 0.3s ease;">
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg" style="padding:12px 0;">
        <div class="container-fluid px-0">

          <!-- ===== LOGO ===== -->
          <a class="navbar-brand" href="home.php?id=accueil" style="font-family:'Island Moments',cursive;font-size:28px;font-weight:400;color:var(--text);display:flex;align-items:center;gap:10px;letter-spacing:1px;">
            <span style="display:inline-flex;align-items:center;justify-content:center;background:linear-gradient(135deg,#8e44ad,#3498db);color:#fff;width:38px;height:38px;border-radius:12px;font-size:18px;transition:0.3s;">
              <i class="fa fa-shop"></i>
            </span>
            <span style="background:linear-gradient(135deg,#8e44ad,#3498db);-webkit-background-clip:text;-webkit-text-fill-color:transparent;">Django Transs</span>
          </a>

          <!-- ===== BOUTON TOGGLE MOBILE ===== -->
          <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation" style="padding:8px 12px;color:var(--text);">
            <i class="fa-solid fa-bars" style="font-size:1.4rem;"></i>
          </button>

          <!-- ===== MENU NAVIGATION ===== -->
          <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav ms-auto align-items-lg-center" style="gap:4px;">

              <!-- Lien Accueil -->
              <li class="nav-item">
                <a class="nav-link" href="DeconnexionServlet">
                  <i class="fa fa-lock" style="color:#8e44ad;width:20px;text-align:center;"></i>
                  <span> Deconnexion </span>
                </a>
              </li>

              <!-- ===== TOGGLE DARK MODE ===== -->
              <li class="nav-item">
                <button id="theme-toggle" class="theme-btn" aria-pressed="false" style="background:var(--card);border:1px solid #e0e0e0;border-radius:30px;padding:8px 16px;display:flex;align-items:center;gap:8px;font-size:0.85rem;font-weight:500;color:var(--text);transition:0.3s;cursor:pointer;box-shadow:0 2px 8px rgba(0,0,0,0.04);">
                  <i class="fa-solid fa-moon" id="theme-icon"></i>
                  <span id="theme-label">Sombre</span>
                </button>
              </li>

              <!-- ===== AVATAR / PROFIL ===== -->
              <li class="nav-item" style="margin-left:4px;">
                <a class="nav-link" href="#profil" style="padding:4px;">
                  <div style="width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,#8e44ad,#3498db);display:flex;align-items:center;justify-content:center;color:#fff;font-weight:600;font-size:0.9rem;transition:0.3s;box-shadow:0 2px 10px rgba(142,68,173,0.25);">
                    <i class="fa-solid fa-user"></i>
                  </div>
                </a>
              </li>

            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>

  <!-- ===== SCRIPT DARK MODE ===== -->
  <script>
    (function() {
      const toggleBtn = document.getElementById('theme-toggle');
      const themeIcon = document.getElementById('theme-icon');
      const themeLabel = document.getElementById('theme-label');
      const rootEl = document.documentElement;
      const STORAGE_KEY = 'site-theme';


      function applyTheme(theme) {
        if (theme === 'dark') {
          rootEl.classList.add('dark');
          themeIcon.className = 'fa-solid fa-sun';
          themeLabel.textContent = 'Clair';
          toggleBtn.setAttribute('aria-pressed', 'true');
        } else {
          rootEl.classList.remove('dark');
          themeIcon.className = 'fa-solid fa-moon';
          themeLabel.textContent = 'Sombre';
          toggleBtn.setAttribute('aria-pressed', 'false');
        }
      }


      function loadTheme() {
        const saved = localStorage.getItem(STORAGE_KEY);
        if (saved) return saved;
        const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
        return prefersDark ? 'dark' : 'light';
      }

      // Sauvegarder le th�me
      function saveTheme(theme) {
        localStorage.setItem(STORAGE_KEY, theme);
      }

      // Initialisation
      const initialTheme = loadTheme();
      applyTheme(initialTheme);

      // �v�nement click
      toggleBtn.addEventListener('click', () => {
        const newTheme = rootEl.classList.contains('dark') ? 'light' : 'dark';
        applyTheme(newTheme);
        saveTheme(newTheme);
      });

      // �couter les changements de pr�f�rence syst�me
      if (window.matchMedia) {
        const mq = window.matchMedia('(prefers-color-scheme: dark)');
        mq.addEventListener('change', (e) => {
          if (!localStorage.getItem(STORAGE_KEY)) {
            applyTheme(e.matches ? 'dark' : 'light');
          }
        });
      }
    })();
  </script>

  <!-- ===== STYLES SP�CIFIQUES ===== -->
  <style>
    /* Variables pour le th�me */
    :root {
      --bg: #ffffff;
      --card: #ffffff;
      --text: #1a1a2e;
      --text-secondary: #555;
      --border-color: #e8e8e8;
      --shadow: 0 2px 12px rgba(0,0,0,0.06);
    }
    .dark {
      --bg: #0d0d1a;
      --card: #1a1a2e;
      --text: #e8e8f0;
      --text-secondary: #aaa;
      --border-color: #2a2a4a;
      --shadow: 0 2px 12px rgba(0,0,0,0.3);
    }

    /* Style g�n�ral du body */
    body {
      background: var(--bg);
      color: var(--text);
      transition: background 0.3s ease, color 0.3s ease;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      margin: 0;
      padding: 0;
      min-height: 100vh;
    }

    /* Navigation */
    .nav-item {
      margin: 0 2px;
    }

    .nav-link {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 0.9rem;
      font-weight: 500;
      color: var(--text-secondary);
      padding: 8px 14px;
      border-radius: 30px;
      transition: all 0.25s ease;
      text-decoration: none;
      position: relative;
    }

    .nav-link:hover {
      color: var(--text);
      background: rgba(142, 68, 173, 0.08);
      text-decoration: none;
    }

    .nav-link.active {
      color: #8e44ad;
      background: rgba(142, 68, 173, 0.12);
    }

    .nav-link.active::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 20px;
      height: 3px;
      background: linear-gradient(90deg, #8e44ad, #3498db);
      border-radius: 4px;
    }

    .nav-link i {
      font-size: 1.1rem;
      transition: 0.2s;
    }

    .nav-link:hover i {
      transform: scale(1.1);
    }

    /* Bouton th�me */
    .theme-btn {
      background: var(--card);
      border: 1px solid var(--border-color);
      border-radius: 30px;
      padding: 8px 16px;
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 0.85rem;
      font-weight: 500;
      color: var(--text);
      transition: all 0.3s ease;
      cursor: pointer;
      box-shadow: var(--shadow);
    }

    .theme-btn:hover {
      transform: scale(1.03);
      border-color: #8e44ad;
      box-shadow: 0 4px 15px rgba(142, 68, 173, 0.15);
    }

    .theme-btn:active {
      transform: scale(0.95);
    }

    /* Avatar */
    .nav-link .avatar-circle:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 20px rgba(142, 68, 173, 0.35);
    }

    /* Mobile */
    @media (max-width: 992px) {
      .navbar-nav {
        padding-top: 12px;
        gap: 2px !important;
      }
      .nav-link {
        padding: 10px 16px;
        border-radius: 12px;
      }
      .nav-link.active::after {
        display: none;
      }
      .nav-link.active {
        background: rgba(142, 68, 173, 0.12);
        border-left: 3px solid #8e44ad;
        border-radius: 0 12px 12px 0;
      }
      .theme-btn {
        width: 100%;
        justify-content: center;
        margin: 6px 0;
      }
      .nav-item:last-child {
        margin-top: 6px;
      }
    }

    @media (max-width: 576px) {
      .navbar-brand {
        font-size: 22px !important;
      }
      .navbar-brand span:first-child {
        width: 32px;
        height: 32px;
        font-size: 14px;
        border-radius: 10px;
      }
    }
  </style>