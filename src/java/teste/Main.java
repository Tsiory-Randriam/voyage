package teste;

import dao.FraisDao;
import dao.ReservationDao;
import dao.TestePlaceDao;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.ClientPlaceModele;
import models.ReservationModele;
// import models.ReservationModele; // Inutilisé, mais vous pouvez le garder

/**
 *
 * @author SUKUNA
 */
public class Main {
    public static void main(String[] args) {  
    
    ReservationDao reservationClient=new ReservationDao(); 
        try {
            int id = reservationClient.dernierIdFrais();
            int frais = reservationClient.dernierFrais(id);
            System.out.println(frais);
        } catch (SQLException ex) {
            System.getLogger(Main.class.getName()).log(System.Logger.Level.ERROR, (String) null, ex);
        }
}
}