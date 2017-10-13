import java.util.ArrayList;
public class Note {
	private int id;
	private String name;
	private ArrayList<Category> categories = new ArrayList<Category>();
	private ArrayList<Reminder> reminders = new ArrayList<Reminder>();
	private String text;
	
	public Note(int id, String name, String text) {
		this.id = id;
		this.name = name;
		this.text = text;
	}
	
	public Note(int id, String text) {
		this.id = id;
		this.text = text;
	}
	
	public Note() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Category> getCategories() {
		return categories;
	}
	public void setCategories(ArrayList<Category> categories) {
		this.categories = categories;
	}
	public ArrayList<Reminder> getReminders() {
		return reminders;
	}
	public void setReminders(ArrayList<Reminder> reminders) {
		this.reminders = reminders;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
