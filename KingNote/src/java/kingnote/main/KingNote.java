package kingnote.main;

import kingnote.model.Reminder;
import kingnote.model.Category;
import kingnote.model.Note;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class KingNote {

    private List<Note> notes = new ArrayList<>();
    private ArrayList<Note> trash = new ArrayList<>();

    // BEGIN - Entity Note
    public void addNote(String title, String text) {
        Note newNote = new Note(title, text);
        getNotes().add(newNote);
    }

    public void editNote(String id, String title, String text) {
        Note returnSearch = searchNote(id);
        if (returnSearch != null) {
            returnSearch.setText(text);
            if (title.length() > 0) {
                returnSearch.setTitle(title);
            } else {
                returnSearch.setTitle(text.substring(0, 20));
            }
        }
    }

    public void removeNote(String id) {
        Note returnSearch = searchNote(id);
        if (returnSearch != null) {
            getTrash().add(returnSearch);
            getNotes().remove(returnSearch);
        }
    }

    private Note searchNote(String id) {
        for (Note note : getNotes()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Entity Note

    // BEGIN - Entity Trash
    public void restoreTrash(String id) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            getTrash().remove(returnSearch);
            getNotes().add(returnSearch);
        }
    }

    public void removeTrash(String id) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            getTrash().remove(returnSearch);
        }
    }

    private Note searchTrash(String id) {
        for (Note note : getTrash()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Entity Trash

    // BEGIN - Entity Reminder
    public ArrayList<Reminder> getReminders(String idNote) {
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            return returnSearch.getReminders();
        }
        return null;
    }

    public void addReminder(String idNote, String title, Date data) {
        Reminder newReminder = new Reminder(title, data);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getReminders().add(newReminder);
        }
    }

    public void editReminder(String idReminder, String title, Date data) {
        Reminder returnSearchReminder = searchReminderInAll(idReminder);
        if (returnSearchReminder != null) {
            returnSearchReminder.setData(data);
            returnSearchReminder.setTitle(title);
        }
    }

    public String removeReminder(String idReminder) {
        Note returnSearchNote = searchNoteOfReminder(idReminder);
        if (returnSearchNote != null) {
            Reminder returnSearchReminder = searchReminder(returnSearchNote, idReminder);
            if (returnSearchReminder != null) {
                returnSearchNote.getReminders().remove(returnSearchReminder);
                return returnSearchNote.getId();
            }
        }
        return "";
    }

    private Reminder searchReminder(Note note, String id) {
        for (Reminder reminder : note.getReminders()) {
            if (reminder.getId().contains(id)) {
                return reminder;
            }
        }
        return null;
    }

    private Reminder searchReminderInAll(String idReminder) {
        for (Note note : notes) {
            for (Reminder reminder : note.getReminders()) {
                if (reminder.getId().contains(idReminder)) {
                    return reminder;
                }
            }
        }
        return null;
    }

    private Note searchNoteOfReminder(String idReminder) {
        for (Note note : notes) {
            for (Reminder reminder : note.getReminders()) {
                if (reminder.getId().contains(idReminder)) {
                    return note;
                }
            }
        }
        return null;
    }
    // END - Entity Reminder

    // BEGIN - Entity Category
    public void addCategory(String idNote, String name, String color) {
        Category newCategory = new Category(name, color);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getCategories().add(newCategory);
        }
    }

    public void addCategory(String idNote, String idCategory) {
        Category returnSearchCategory = searchCategory(idCategory);
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null && returnSearchCategory != null) {
            if (!existsCategoryInNote(returnSearchNote, returnSearchCategory)) {
                returnSearchNote.getCategories().add(returnSearchCategory);
            }
        }
    }

    public boolean existsCategoryInNote(Note note, Category category) {
        for (Category cat : note.getCategories()) {
            if (cat.getId() == category.getId()) {
                return true;
            }
        }
        return false;
    }

    public void editCategory(String idNote, String idCategory, String name, String color) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Category returnSearchCategory = searchCategory(returnSearchNote, idCategory);
            if (returnSearchCategory != null) {
                returnSearchCategory.setColor(color);
                returnSearchCategory.setName(name);
            }
        }
    }

    public void removeCategory(String idNote, String idCategory) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Category returnSearchCategory = searchCategory(returnSearchNote, idCategory);
            if (returnSearchCategory != null) {
                returnSearchNote.getCategories().remove(returnSearchCategory);
            }
        }
    }

    private Category searchCategory(Note note, String id) {
        for (Category category : note.getCategories()) {
            if (category.getId().equals(id)) {
                return category;
            }
        }
        return null;
    }

    private Category searchCategory(String id) {
        for (Category Category : getAllCategories()) {
            if (Category.getId().equals(id)) {
                return Category;
            }
        }
        return null;
    }

    public ArrayList<Category> getCategories(String idNote) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            return returnSearchNote.getCategories();
        }
        return null;
    }

    public Set<Category> getAllCategories() {
        Set<Category> list = new HashSet<>();
        for (Note note : notes) {
            for (Category category : note.getCategories()) {
                list.add(category);
            }
        }
        return list;
    }
    // END - Entity Category

    public List<Note> getNotes() {
        return notes;
    }

    public void setNotes(ArrayList<Note> notes) {
        this.notes = notes;
    }

    public ArrayList<Note> getTrash() {
        return trash;
    }

    public void setTrash(ArrayList<Note> trash) {
        this.trash = trash;
    }
}
