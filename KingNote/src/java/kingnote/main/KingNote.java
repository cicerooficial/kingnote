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

    // BEGIN - Note
    /**
     * adiciona uma nota com titulo e texto
     *
     * @param title
     * @param text
     */
    public void addNote(String title, String text) {
        getNotes().add(new Note(title, text));
    }

    /**
     * edita uma nota indicada pelo id
     *
     * @param id
     * @param title
     * @param text
     */
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

    /**
     * remove a nota que for indicada pelo id
     *
     * @param id
     */
    public void removeNote(String id) {
        Note returnSearch = searchNote(id);
        if (returnSearch != null) {
            getTrash().add(returnSearch);
            getNotes().remove(returnSearch);
        }
    }

    /**
     * procura nota por id
     *
     * @param id
     * @return
     */
    private Note searchNote(String id) {
        for (Note note : getNotes()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Note

    // BEGIN - Trash
    /**
     * restaura nota que estava na lixeira
     *
     * @param id
     */
    public void restoreTrash(String id) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            getTrash().remove(returnSearch);
            getNotes().add(returnSearch);
        }
    }

    /**
     * Remove da lixeira, deleta da sessão definitivamente
     *
     * @param id
     */
    public void removeTrash(String id) {
        Note returnSearch = searchTrash(id);
        if (returnSearch != null) {
            getTrash().remove(returnSearch);
        }
    }

    /**
     * procura nota na lixeira pelo id
     *
     * @param id
     * @return
     */
    private Note searchTrash(String id) {
        for (Note note : getTrash()) {
            if (note.getId().equals(id)) {
                return note;
            }
        }
        return null;
    }
    // END - Trash

    // BEGIN - Reminder
    /**
     * retorna a lista de lembretes de uma nota indicada pelo id.
     *
     * @param idNote
     * @return
     */
    public ArrayList<Reminder> getReminders(String idNote) {
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            return returnSearch.getReminders();
        }
        return null;
    }

    /**
     * adiciona um lembrete com titulo e data para uma nota indicada pelo id
     *
     * @param idNote
     * @param title
     * @param data
     */
    public void addReminder(String idNote, String title, Date data) {
        Reminder newReminder = new Reminder(title, data);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getReminders().add(newReminder);
        }
    }

    /**
     * edita titulo e data de um lembrete for indicada pelo id do lembrete.
     *
     * @param idReminder
     * @param title
     * @param data
     */
    public void editReminder(String idReminder, String title, Date data) {
        Reminder returnSearchReminder = searchReminderInAll(idReminder);
        if (returnSearchReminder != null) {
            returnSearchReminder.setData(data);
            returnSearchReminder.setTitle(title);
        }
    }

    /**
     * remove lembrete pelo id.
     *
     * @param idReminder
     * @return
     */
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

    /**
     * procura lembrete em uma nota, busca atraves do id do lembrete
     *
     * @param note
     * @param id
     * @return
     */
    private Reminder searchReminder(Note note, String id) {
        for (Reminder reminder : note.getReminders()) {
            if (reminder.getId().contains(id)) {
                return reminder;
            }
        }
        return null;
    }

    /**
     * busca em todas as notas um lembrete indicado pelo id
     *
     * @param idReminder
     * @return
     */
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

    /**
     * busca uma nota que contenha o lembrete indicado pelo id.
     *
     * @param idReminder
     * @return
     */
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
    // END - Reminder

    // BEGIN - Category
    /**
     * adiciona uma nova categoria a uma nota com nome e cor RGB
     *
     * @param idNote
     * @param name
     * @param color
     */
    public void addCategory(String idNote, String name, String color) {
        Category newCategory = new Category(name, color);
        Note returnSearch = searchNote(idNote);
        if (returnSearch != null) {
            returnSearch.getCategories().add(newCategory);
        }
    }

    /**
     * adiciona categoria pre-existe a uma nota, indicando o id da nota e o id
     * da categoria
     *
     * @param idNote
     * @param idCategory
     */
    public void addCategory(String idNote, String idCategory) {
        Category returnSearchCategory = searchCategory(idCategory);
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null && returnSearchCategory != null) {
            if (!existsCategoryInNote(returnSearchNote, returnSearchCategory)) {
                returnSearchNote.getCategories().add(returnSearchCategory);
            }
        }
    }

    /**
     * verifica se existe uma categoria em uma nota.
     *
     * @param note
     * @param category
     * @return
     */
    public boolean existsCategoryInNote(Note note, Category category) {
        for (Category cat : note.getCategories()) {
            if (cat.getId() == category.getId()) {
                return true;
            }
        }
        return false;
    }

    /**
     * edita categoria de uma nota. NÃO UTILIZADO
     *
     * @param idNote
     * @param idCategory
     * @param name
     * @param color
     */
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

    /**
     * remove categoria de uma nota indicando o id dos dois.
     *
     * @param idNote
     * @param idCategory
     */
    public void removeCategory(String idNote, String idCategory) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            Category returnSearchCategory = searchCategory(returnSearchNote, idCategory);
            if (returnSearchCategory != null) {
                returnSearchNote.getCategories().remove(returnSearchCategory);
            }
        }
    }

    /**
     * busca e retorna a categoria que esteja em uma nota, busca realizada pelo
     * id da categoria
     *
     * @param note
     * @param id
     * @return
     */
    private Category searchCategory(Note note, String id) {
        for (Category category : note.getCategories()) {
            if (category.getId().equals(id)) {
                return category;
            }
        }
        return null;
    }

    /**
     * busca e retorna a categoria indicada pelo id, a busca é global, todas as
     * categorias cadastradas
     *
     * @param id
     * @return
     */
    private Category searchCategory(String id) {
        for (Category Category : getAllCategories()) {
            if (Category.getId().equals(id)) {
                return Category;
            }
        }
        return null;
    }

    /**
     * retorna o arraylist de categorias de uma nota.
     *
     * @param idNote
     * @return
     */
    public ArrayList<Category> getCategories(String idNote) {
        Note returnSearchNote = searchNote(idNote);
        if (returnSearchNote != null) {
            return returnSearchNote.getCategories();
        }
        return null;
    }

    /**
     * retorna o arraylist de todas as categorias, global
     *
     * @return
     */
    public Set<Category> getAllCategories() {
        Set<Category> list = new HashSet<>();
        for (Note note : notes) {
            for (Category category : note.getCategories()) {
                list.add(category);
            }
        }
        return list;
    }

    // END - Category
    /**
     * retorna um list de notas considerando a busca e o filtro
     *
     * @param search
     * @param filter
     * @return
     */
    public List<Note> getNotesSearchAndFilter(String search, String filter) {
        List<Note> result = new ArrayList<>();
        if (search == "" && filter == "") {
            return getNotes();
        } else if (search != "" && filter != "") {
            for (Note note : getNotes()) {
                if (note.getTitle().contains(search)) {
                    for (Category category : note.getCategories()) {
                        if (category.getId().equals(filter)) {
                            result.add(note);
                        }
                    }
                }
            }
        } else if (search != "" && filter == "") {
            for (Note note : getNotes()) {
                if (note.getTitle().contains(search)) {
                    result.add(note);
                }
            }
        } else if (search == "" && filter != "") {
            for (Note note : getNotes()) {
                for (Category category : note.getCategories()) {
                    if (category.getId().equals(filter)) {
                        result.add(note);
                    }
                }
            }
        }

        return result;
    }

    /**
     * retorna as notas
     *
     * @return
     */
    public List<Note> getNotes() {
        return notes;
    }

    /**
     * retorna as notas com a busca e filtro
     *
     * @return
     */
    public List<Note> getNotes(String search, String filter) {
        return getNotesSearchAndFilter(search, filter);
    }

    /**
     * seta o array list das notas. NÃO UTILIZADO
     *
     * @param notes
     */
    public void setNotes(ArrayList<Note> notes) {
        this.notes = notes;
    }

    /**
     * retorna o array list da lixeira
     *
     * @return
     */
    public ArrayList<Note> getTrash() {
        return trash;
    }

    /**
     * seta o array list da lixeira. NÃO UTILIZADO
     *
     * @param trash
     */
    public void setTrash(ArrayList<Note> trash) {
        this.trash = trash;
    }
}
