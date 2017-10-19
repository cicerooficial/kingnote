package kingnote.model;

import java.util.Date;
import java.util.UUID;

public class Reminder {

    private String id;
    private String title;
    private Date data;

    public Reminder(String title, Date data) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.data = data;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

}
