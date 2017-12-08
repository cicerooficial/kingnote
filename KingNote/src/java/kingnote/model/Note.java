package kingnote.model;

import java.util.ArrayList;
import java.util.UUID;

public class Note {

    private String id;
    private String title;
    private ArrayList<Category> categories = new ArrayList<>();
    private ArrayList<Reminder> reminders = new ArrayList<>();
    private String text;

    /**
     * Construtor da nota, o id é gerado aleatoriamente pelo Java
     *
     * @param title
     * @param text
     */
    public Note(String title, String text) {
        this.id = UUID.randomUUID().toString();
        if (title.length() > 0) {
            this.title = title;
        } else {
            this.title = text.substring(0, 20);
        }
        this.text = text;
    }

    /**
     * Retorna o id da nota
     *
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * Retorna o titulo da nota
     *
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Seta o titulo da nota
     *
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Retorna o texto da nota
     *
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * Seta o texto da nota
     *
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * Retorna o arraylist de categorias
     *
     * @return the categories
     */
    public ArrayList<Category> getCategories() {
        return categories;
    }

    /**
     * Seta o arraylist de categorias
     *
     * @param categories the categories to set
     */
    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }

    /**
     * Retorna o arraylist de lembretes
     *
     * @return the reminders
     */
    public ArrayList<Reminder> getReminders() {
        return reminders;
    }

    /**
     * Seta o arraylist de lembretes
     *
     * @param reminders the reminders to set
     */
    public void setReminders(ArrayList<Reminder> reminders) {
        this.reminders = reminders;
    }

}
