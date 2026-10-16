package servlet;

import dao.ReservationDao;
import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.ReservationModele;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

@WebServlet(name = "RecuServlet", urlPatterns = {"/RecuServlet"})
public class RecuServlet extends HttpServlet {

    // Couleurs du design
    private static final Color BLEU = new Color(12, 65, 120);
    private static final Color TURQUOISE = new Color(0, 160, 210);
    private static final Color BLEU_CLAIR = new Color(235, 247, 253);
    private static final Color GRIS = new Color(100, 116, 139);
    private static final Color TEXTE = new Color(25, 45, 70);
    private static final Color BLANC = Color.WHITE;

    private void texte(PDPageContentStream cs, String contenu,
                        float x, float y, float taille,
                        Color couleur, PDType1Font police)
            throws IOException {
        String valeur = contenu == null ? "-" : contenu;
        valeur = valeur.replace("’", "'")
                       .replace("–", "-")
                       .replace("—", "-")
                       .replace("€", "EUR");

        cs.beginText();
        cs.setFont(police, taille);
        cs.setNonStrokingColor(couleur);
        cs.newLineAtOffset(x, y);
        cs.showText(valeur);
        cs.endText();
    }

    private void rectangle(PDPageContentStream cs, float x, float y,
                           float largeur, float hauteur, Color couleur)
            throws IOException {
        cs.setNonStrokingColor(couleur);
        cs.addRect(x, y, largeur, hauteur);
        cs.fill();
    }

    private void ligne(PDPageContentStream cs, float x1, float y1,
                       float x2, float y2, Color couleur)
            throws IOException {
        cs.setStrokingColor(couleur);
        cs.setLineWidth(0.7f);
        cs.moveTo(x1, y1);
        cs.lineTo(x2, y2);
        cs.stroke();
    }

    private String valeur(String v) {
        return v == null || v.trim().isEmpty() ? "-" : v.trim();
    }

    protected void processRequest(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDao reservationDao = new ReservationDao();

        try {
            // Récupération de la dernière réservation et des frais
            int dernierId = reservationDao.dernierIdReservation();
            List<ReservationModele> reservations = reservationDao.dernierReservation(dernierId);

            if (reservations == null || reservations.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Aucune réservation trouvée.");
                return;
            }

            ReservationModele res = reservations.get(0);
            
            int idFrais = reservationDao.dernierIdFrais();
            int frais_ = reservationDao.dernierFrais(idFrais);
            String frais = Integer.toString(frais_) + " Ar";

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=recu_voyage_voiture.pdf");

            try (PDDocument document = new PDDocument()) {
                PDPage page = new PDPage(PDRectangle.A4);
                document.addPage(page);

                try (PDPageContentStream cs = new PDPageContentStream(document, page)) {
                    float largeur = page.getMediaBox().getWidth();
                    float marge = 35;
                    float droite = largeur - marge;

                    // 1. Fond de la page
                    rectangle(cs, 0, 0, largeur, 842, BLANC);

                    // 2. En-tête
                    rectangle(cs, 0, 700, largeur, 142, BLEU);
                    rectangle(cs, 0, 700, largeur, 5, TURQUOISE);

                    texte(cs, "VOYAGE AGENCIES", marge, 793, 23, BLANC, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "VOYAGE AVEC VOITURE", marge, 768, 12, new Color(125, 220, 245), PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Explorez. Roulez. Découvrez.", marge, 747, 10, BLANC, PDType1Font.HELVETICA_OBLIQUE);

                    texte(cs, "RECU", 425, 795, 25, BLANC, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "N : " + dernierId, 430, 772, 11, new Color(125, 220, 245), PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Antananarivo, Madagascar", marge, 720, 9, BLANC, PDType1Font.HELVETICA);

                    // 3. Bloc client
                    rectangle(cs, marge, 565, 525, 112, BLEU_CLAIR);
                    texte(cs, "INFORMATIONS DU CLIENT", marge + 15, 655, 12, BLEU, PDType1Font.HELVETICA_BOLD);
                    ligne(cs, marge + 15, 646, droite - 15, 646, new Color(190, 220, 238));

                    texte(cs, "Nom du client :", marge + 15, 625, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getUsername()), marge + 120, 625, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    texte(cs, "Contact :", marge + 15, 605, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getContact()), marge + 120, 605, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    texte(cs, "Destination :", marge + 15, 585, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getDestignation_reservation()), marge + 120, 585, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    // 4. Détails du voyage
                    texte(cs, "DETAILS DU VOYAGE", marge, 535, 12, BLEU, PDType1Font.HELVETICA_BOLD);
                    rectangle(cs, marge, 455, 525, 62, BLANC);

                    cs.setStrokingColor(new Color(205, 220, 232));
                    cs.addRect(marge, 455, 525, 62);
                    cs.stroke();

                    texte(cs, "Date du voyage :", marge + 12, 495, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getDate_voyage()), marge + 125, 495, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    texte(cs, "Heure de départ :", marge + 12, 474, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getHeure_depart()), marge + 125, 474, 10, TEXTE, PDType1Font.HELVETICA_BOLD);
                    
                    texte(cs, "N° Place :", marge + 12, 459, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, valeur(res.getNumero_place()), marge + 125, 459, 10, TEXTE, PDType1Font.HELVETICA_BOLD);
                    
                    // 5. Tableau des prestations
                    texte(cs, "DETAIL DES PRESTATIONS", marge, 430, 12, BLEU, PDType1Font.HELVETICA_BOLD);
                    
                    float tableY = 394;
                    float tableH = 30;

                    rectangle(cs, marge, tableY, 525, tableH, BLEU);
                    texte(cs, "Prestation", marge + 10, tableY + 10, 10, BLANC, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Description", marge + 165, tableY + 10, 10, BLANC, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Montant", marge + 430, tableY + 10, 10, BLANC, PDType1Font.HELVETICA_BOLD);

                    rectangle(cs, marge, tableY - 35, 525, 35, new Color(248, 251, 254));
                    cs.setStrokingColor(new Color(205, 220, 232));
                    cs.addRect(marge, tableY - 35, 525, 35);
                    cs.stroke();

                    texte(cs, "Transport", marge + 10, tableY - 21, 9, TEXTE, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Voyage avec voiture", marge + 165, tableY - 21, 9, TEXTE, PDType1Font.HELVETICA);
                    texte(cs, frais, marge + 430, tableY - 21, 9, TEXTE, PDType1Font.HELVETICA_BOLD);

                    // 6. Encadré véhicule (Données dynamiques si disponibles dans le modèle, ex: res.getVoiture())
                    rectangle(cs, marge, 286, 525, 48, BLEU_CLAIR);
                    texte(cs, "VEHICULE / LOCATION", marge + 12, 316, 10, BLEU, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Voiture : " + valeur(res.getDestignation_reservation()), marge + 12, 298, 9, TEXTE, PDType1Font.HELVETICA);
                    texte(cs, "Statut : Confirmé", marge + 270, 298, 9, TEXTE, PDType1Font.HELVETICA);

                    // 7. Récapitulatif financier
                    texte(cs, "RECAPITULATIF DU PAIEMENT", marge, 260, 12, BLEU, PDType1Font.HELVETICA_BOLD);
                    rectangle(cs, marge, 170, 525, 75, new Color(248, 251, 254));

                    texte(cs, "Sous-total :", marge + 15, 225, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, frais, marge + 420, 225, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    texte(cs, "Montant payé :", marge + 15, 204, 10, GRIS, PDType1Font.HELVETICA);
                    texte(cs, frais, marge + 420, 204, 10, TEXTE, PDType1Font.HELVETICA_BOLD);

                    rectangle(cs, marge, 170, 525, 25, BLEU);
                    texte(cs, "TOTAL A PAYER", marge + 15, 178, 11, BLANC, PDType1Font.HELVETICA_BOLD);
                    texte(cs, frais, marge + 385, 178, 11, BLANC, PDType1Font.HELVETICA_BOLD);

                    // 8. Mode de paiement
                    texte(cs, "Mode de paiement : Espèces / Mobile Money", marge, 150, 9, TEXTE, PDType1Font.HELVETICA);
                    texte(cs, "Reste à payer : 0 Ar", marge, 133, 9, TEXTE, PDType1Font.HELVETICA);

                    // 9. Signature
                    texte(cs, "Merci pour votre confiance !", marge, 93, 13, BLEU, PDType1Font.HELVETICA_OBLIQUE);
                    texte(cs, "Signature du client", 400, 100, 9, GRIS, PDType1Font.HELVETICA);
                    ligne(cs, 390, 82, droite, 82, GRIS);

                    // 10. Pied de page
                    ligne(cs, marge, 60, droite, 60, TURQUOISE);
                    texte(cs, "Bon voyage avec Voyage Agencies !", marge, 43, 9, BLEU, PDType1Font.HELVETICA_BOLD);
                    texte(cs, "Conservez ce reçu comme justificatif de réservation.", marge, 28, 8, GRIS, PDType1Font.HELVETICA);
                }

                try (OutputStream out = response.getOutputStream()) {
                    document.save(out);
                    out.flush();
                }
            }

        } catch (SQLException ex) {
            log("Erreur SQL pendant la génération du reçu PDF.", ex);
            if (!response.isCommitted()) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur SQL lors de la récupération de la réservation.");
            }
        } catch (Exception ex) {
            log("Erreur pendant la génération du reçu PDF.", ex);
            if (!response.isCommitted()) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Impossible de générer le reçu PDF.");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Génération de reçu PDF pour les voyages avec voiture.";
    }
}