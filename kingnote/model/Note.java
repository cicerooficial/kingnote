package kingnote.model;

import java.util.ArrayList;
import java.util.UUID;

public class Note {

    private String id;
    private String title;
    private ArrayList<Category> categories = new ArrayList<>();
    private ArrayList<Reminder> reminders = new ArrayList<>();
    private String text;

    public Note(String title, String text) {
        this.id = UUID.randomUUID().toString();
        this.title = title;
        this.text = text;
    }

    public Note(String text) {
        this.id = UUID.randomUUID().toString();
        this.title = text.substring(0, 20);
        this.text = text;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the categories
     */
    public ArrayList<Category> getCategories() {
        return categories;
    }

    /**
     * @param categories the categories to set
     */
    public void setCategories(ArrayList<Category> categories) {
        this.categories = categories;
    }

    /**
     * @return the reminders
     */
    public ArrayList<Reminder> getReminders() {
        return reminders;
    }

    /**
     * @param reminders the reminders to set
     */
    public void setReminders(ArrayList<Reminder> reminders) {
        this.reminders = reminders;
    }

}
