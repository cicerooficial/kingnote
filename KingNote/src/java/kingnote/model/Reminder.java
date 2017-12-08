package kingnote.model;

import java.util.Date;
import java.util.UUID;

public class Reminder {

    private String id;
    private String title;
    private Date data;

    /**
     * Construtor do lembrete, é gerado um id aleatorio pelo java, classe UUID
     *
     * @param title
     * @param data
     */
    public Reminder(String title, Date data) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.data = data;
    }

    /**
     * Retorna o id do lembrete
     *
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * Retorna o titulo
     *
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     * Seta o titulo
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Retorna a data
     *
     * @return
     */
    public Date getData() {
        return data;
    }
    
    /**
     * Seta a data
     * @param data 
     */
    public void setData(Date data) {
        this.data = data;
    }

}
